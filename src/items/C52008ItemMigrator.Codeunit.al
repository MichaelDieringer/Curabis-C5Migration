namespace CurabisC5.CurabisCMigration;
using System.Integration;
using Microsoft.Inventory.BOM;
using Microsoft.Pricing.Source;
using Microsoft.Pricing.Asset;

/// <summary>
/// Codeunit C5 Item Migrator (ID 51867).
/// </summary>
codeunit 51867 "C5 2008 Item Migrator"
{
    TableNo = "C5 2008 InvenTable";

    var
        UninitializedItemDataMigrationFacade: Codeunit "Item Data Migration Facade";
        ReferencedItemDoesNotExistErr: Label 'Item %1 is related to %2, but we couldn’t find %2. Try migrating again.', Comment = '%1 is the current item number, %2 is the referenced item''s number';
        SerialNumberTrackingCodeTxt: Label 'SN', Comment = 'All caps, 10 characters max because Code[10] in baseapp';
        SerialNumberTrackingDescriptionTxt: Label 'Serial number tracking';
        BatchTrackingCodeTxt: Label 'BATCH', Comment = 'All caps, 10 characters max because Code[10] in baseapp';
        BatchTrackingDescriptionTxt: Label 'Batch tracking';
        InventPriceGroupNotFoundErr: Label 'The InventPriceGroup ''%1'' was not found.', Comment = '%1 = invent price group group';
        ItemTypeOption: Option Inventory,Service;
        ItemJournalBatchNameTxt: Label 'ITEMMIGR', Locked = true;
        FakeProductPostingGroupPrefixLbl: Label 'MIGRATION', Locked = true;
        UnitOfMeasureNotSpecifiedErr: Label 'A unit of measure is not specified for item %1.', Comment = '%1 is the current item number';
        ServiceItemInBOMErr: Label 'BOMs cannot include service items in %1. You must remove %2 from the BOM for %3.', Comment = '%1=Product name %2=Component item %3 = main item';

    /// <summary>
    /// OnMigrateItem.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Item Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Data Migration Facade", OnMigrateItem, '', true, true)]
    local procedure OnMigrateItem(var Sender: Codeunit "Item Data Migration Facade"; RecordIdToMigrate: RecordId)
    var
        C5InvenTable: Record "C5 2008 InvenTable";
    begin
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 InvenTable" then
            exit;
        C5InvenTable.Get(RecordIdToMigrate);
        CreateNavItem(C5InvenTable, Sender);
    end;

    /// <summary>
    /// OnMigrateCostingMethod.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Item Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Data Migration Facade", OnMigrateCostingMethod, '', true, true)]
    local procedure OnMigrateCostingMethod(var Sender: Codeunit "Item Data Migration Facade"; RecordIdToMigrate: RecordId)
    var
        C5InvenTable: Record "C5 2008 InvenTable";
    begin
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 InvenTable" then
            exit;
        C5InvenTable.Get(RecordIdToMigrate);

        if ConvertItemType(C5InvenTable.ItemType) = ItemTypeOption::Inventory then begin // only FIFO is valid for services
            Sender.SetCostingMethod(ConvertCostingMethod(C5InvenTable));
            Sender.ModifyItem(false);
        end;
    end;

    local procedure CreateNavItem(C5InvenTable: Record "C5 2008 InvenTable"; ItemDataMigrationFacade: Codeunit "Item Data Migration Facade")
    var
        C5InvenBom: Record "C5 2008 InvenBOM";
        BOMComponent: Record "BOM Component";
        C5InvenTableComponent: Record "C5 2008 InvenTable";
        DivideCostBy: Decimal;
    begin
        if not ItemDataMigrationFacade.CreateItemIfNeeded(C5InvenTable.ItemNumber,
                                                          C5InvenTable.ItemName1,
                                                          C5InvenTable.ItemName2,
                                                          ConvertItemType(C5InvenTable.ItemType))
        then
            exit;

        // CostPriceUnit indicates that the cost is for 100 units for example
        if C5InvenTable.CostPriceUnit <> 0 then
            DivideCostBy := C5InvenTable.CostPriceUnit
        else
            DivideCostBy := 1;
        ItemDataMigrationFacade.SetUnitCost(C5InvenTable.CostPrice / DivideCostBy);
        ItemDataMigrationFacade.SetStandardCost(C5InvenTable.CostPrice / DivideCostBy);

        ItemDataMigrationFacade.SetVendorItemNo(C5InvenTable.VendItemNumber);
        ItemDataMigrationFacade.SetNetWeight(C5InvenTable.NetWeight);
        ItemDataMigrationFacade.SetUnitVolume(C5InvenTable.Volume);
        ItemDataMigrationFacade.SetBlocked(C5InvenTable.Blocked = C5InvenTable.Blocked::Yes);
        ItemDataMigrationFacade.SetStockoutWarning(C5InvenTable.WarnNegativeInventory = C5InvenTable.WarnNegativeInventory::Yes);
        ItemDataMigrationFacade.SetPreventNegativeInventory(C5InvenTable.NegativeInventory = C5InvenTable.NegativeInventory::Yes);

        ItemDataMigrationFacade.SetReorderQuantity(C5InvenTable.PurchSeriesSize);

        if C5InvenTable.ItemType in [C5InvenTable.ItemType::BOM, C5InvenTable.ItemType::Kit] then begin
            C5InvenBom.SetRange(BOMItemNumber, C5InvenTable.ItemNumber);
            if C5InvenBom.FindSet() then
                repeat
                    if not ItemDataMigrationFacade.DoesItemExist(C5InvenBom.ItemNumber) then
                        Error(ReferencedItemDoesNotExistErr, C5InvenTable.ItemNumber, C5InvenBom.ItemNumber);
                    C5InvenTableComponent.SetRange(ItemNumber, C5InvenBom.ItemNumber);
                    if C5InvenTableComponent.FindFirst() then begin
                        if C5InvenTableComponent.ItemType = C5InvenTableComponent.ItemType::Service then
                            Error(ServiceItemInBOMErr, ProductName.Short(), C5InvenBom.ItemNumber, C5InvenBom.BOMItemNumber);
                        ItemDataMigrationFacade.CreateBOMComponent(
                            C5InvenBom.ItemNumber, C5InvenBom.Qty, C5InvenBom.Position, BOMComponent.Type::Item.AsInteger());
                    end;
                until C5InvenBom.Next() = 0;
        end;

        // reference to another item
        // to make sure the alt item exists
        // C-MID Hmmm, den alternative varenummer er ikke nødvendigvis brugt som en erstattningsvare men mere som en leverandørvare 
        //       så det er ikke nødvendigvis en fejl at den ikke findes

        //if (C5InvenTable.AltItemNumber <> '') and not ItemDataMigrationFacade.DoesItemExist(C5InvenTable.AltItemNumber) then
        //    Error(ReferencedItemDoesNotExistErr, C5InvenTable.ItemNumber, C5InvenTable.AltItemNumber);
        //ItemDataMigrationFacade.SetAlternativeItemNo(C5InvenTable.AltItemNumber);


        if C5InvenTable.PrimaryVendor <> '' then
            ItemDataMigrationFacade.SetVendorNo(C5InvenTable.PrimaryVendor);

        ItemDataMigrationFacade.ModifyItem(true);
    end;

    /// <summary>
    /// OnMigrateItemTrackingCode.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Item Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Data Migration Facade", OnMigrateItemTrackingCode, '', true, true)]
    local procedure OnMigrateItemTrackingCode(var Sender: Codeunit "Item Data Migration Facade"; RecordIdToMigrate: RecordId)
    var
        C5InvenTable: Record "C5 2008 InvenTable";
    begin
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 InvenTable" then
            exit;
        C5InvenTable.Get(RecordIdToMigrate);

        if C5InvenTable.ItemTracking <> C5InvenTable.ItemTracking::None then begin
            Sender.SetItemTrackingCode(GetOrCreateItemTrackingCode(C5InvenTable.ItemTracking));
            Sender.ModifyItem(false);
        end;
    end;

    /// <summary>
    /// OnMigrateItemUnitOfMeasure.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Item Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Data Migration Facade", OnMigrateItemUnitOfMeasure, '', true, true)]
    local procedure OnMigrateItemUnitOfMeasure(var Sender: Codeunit "Item Data Migration Facade"; RecordIdToMigrate: RecordId)
    var
        C5InvenTable: Record "C5 2008 InvenTable";
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
    begin
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 InvenTable" then
            exit;
        C5InvenTable.Get(RecordIdToMigrate);
        C5SchemaParameters.GetSingleInstance();

        if C5InvenTable.UnitCode = '' then
            C5InvenTable.UnitCode := C5SchemaParameters."Unit of measure Code";

        if C5InvenTable.UnitCode = '' then
            Error(UnitOfMeasureNotSpecifiedErr, C5InvenTable.ItemNumber);

        CreateUnitCodeIfNeeded(C5InvenTable.UnitCode);
        Sender.SetBaseUnitOfMeasure(C5InvenTable.UnitCode);
        Sender.ModifyItem(false);
    end;

    /// <summary>
    /// OnMigrateItemDiscountGroup.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Item Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Data Migration Facade", OnMigrateItemDiscountGroup, '', true, true)]
    local procedure OnMigrateItemDiscountGroup(var Sender: Codeunit "Item Data Migration Facade"; RecordIdToMigrate: RecordId)
    var
        C5InvenTable: Record "C5 2008 InvenTable";
    begin
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 InvenTable" then
            exit;
        C5InvenTable.Get(RecordIdToMigrate);

        if C5InvenTable.DiscGroup <> '' then begin
            CreateItemDiscGroupIfNeeded(C5InvenTable.DiscGroup);

            Sender.SetItemDiscGroup(C5InvenTable.DiscGroup);
            Sender.ModifyItem(false);
        end;
    end;

    /// <summary>
    /// OnMigrateItemSalesLineDiscount.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Item Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Data Migration Facade", OnMigrateItemSalesLineDiscount, '', true, true)]
    local procedure OnMigrateItemSalesLineDiscount(var Sender: Codeunit "Item Data Migration Facade"; RecordIdToMigrate: RecordId)
    var
        C5InvenTable: Record "C5 2008 InvenTable";
    begin
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 InvenTable" then
            exit;
        C5InvenTable.Get(RecordIdToMigrate);
        ImportItemInventoryCustomerDiscountsFromStaging(C5InvenTable);
    end;

    /// <summary>
    /// OnMigrateItemPrices.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Item Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Data Migration Facade", OnMigrateItemPrice, '', true, true)]
    local procedure OnMigrateItemPrices(var Sender: Codeunit "Item Data Migration Facade"; RecordIdToMigrate: RecordId)
    var
        C5InvenTable: Record "C5 2008 InvenTable";
    begin
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 InvenTable" then
            exit;
        C5InvenTable.Get(RecordIdToMigrate);
        ImportItemPricesFromStaging(C5InvenTable);
    end;


    /// <summary>
    /// OnMigrateItemTariffNo.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Item Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Data Migration Facade", OnMigrateItemTariffNo, '', true, true)]
    local procedure OnMigrateItemTariffNo(var Sender: Codeunit "Item Data Migration Facade"; RecordIdToMigrate: RecordId)
    var
        C5InvenTable: Record "C5 2008 InvenTable";
    begin
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 InvenTable" then
            exit;
        C5InvenTable.Get(RecordIdToMigrate);

        if C5InvenTable.TariffNumber <> '' then begin
            CreateTariffNoIfNeeded(C5InvenTable.TariffNumber);
            Sender.SetTariffNo(C5InvenTable.TariffNumber);
            Sender.ModifyItem(false);
        end;
    end;


    /// <summary>
    /// OnMigrateItemDimensions.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Item Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Data Migration Facade", OnMigrateItemDimensions, '', true, true)]
    local procedure OnMigrateItemDimensions(var Sender: Codeunit "Item Data Migration Facade"; RecordIdToMigrate: RecordId)
    var
        C5InvenTable: Record "C5 2008 InvenTable";
        C5HelperFunctions: Codeunit "C5 2008 Helper Functions";
    begin
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 InvenTable" then
            exit;

        C5InvenTable.Get(RecordIdToMigrate);
        if C5InvenTable.Department <> '' then
            Sender.CreateDefaultDimensionAndRequirementsIfNeeded(
                C5HelperFunctions.GetDepartmentDimensionCodeTxt(),
                C5HelperFunctions.GetDepartmentDimensionDescTxt(),
                C5InvenTable.Department,
                C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Department", C5InvenTable.Department));
        if C5InvenTable.Centre <> '' then
            Sender.CreateDefaultDimensionAndRequirementsIfNeeded(
                C5HelperFunctions.GetCostCenterDimensionCodeTxt(),
                C5HelperFunctions.GetCostCenterDimensionDescTxt(),
                C5InvenTable.Centre,
                C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Centre", C5InvenTable.Centre));
        if C5InvenTable.Purpose <> '' then
            Sender.CreateDefaultDimensionAndRequirementsIfNeeded(
                C5HelperFunctions.GetPurposeDimensionCodeTxt(),
                C5HelperFunctions.GetPurposeDimensionDescTxt(),
                C5InvenTable.Purpose,
                C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Purpose", C5InvenTable.Purpose));
    end;

    /// <summary>
    /// OnMigrateItemPostingGroups.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Item Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    /// <param name="ChartOfAccountsMigrated">Boolean.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Data Migration Facade", OnMigrateItemPostingGroups, '', true, true)]
    local procedure OnMigrateItemPostingGroups(var Sender: Codeunit "Item Data Migration Facade"; RecordIdToMigrate: RecordId; ChartOfAccountsMigrated: Boolean)
    var
        C5InvenTable: Record "C5 2008 InvenTable";
        C5InvenItemGroup: Record "C5 2008 InvenItemGroup";
        C5LedTableMigrator: Codeunit "C5 2008 LedTable Migrator";
    begin
        if not ChartOfAccountsMigrated then
            exit;
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 InvenTable" then
            exit;

        C5InvenTable.Get(RecordIdToMigrate);
        C5InvenItemGroup.SetRange(Group, C5InvenTable.Group);
        C5InvenItemGroup.FindFirst();

        Sender.CreateInventoryPostingSetupIfNeeded(C5InvenItemGroup.Group, C5InvenItemGroup.GroupName, '');
        Sender.CreateGeneralProductPostingSetupIfNeeded(C5InvenItemGroup.Group, C5InvenItemGroup.GroupName, '');
        // Create Migration Posting Setup
        Sender.CreateGeneralProductPostingSetupIfNeeded(GetMigrationPostingSetupGroupName(C5InvenItemGroup.Group), C5InvenItemGroup.GroupName, '');

        if C5InvenItemGroup.InventoryInflowAcc <> '' then begin
            Sender.SetInventoryPostingSetupInventoryAccount(
                C5InvenItemGroup.Group,
                '',
                C5LedTableMigrator.FillWithLeadingZeros(C5InvenItemGroup.InventoryInflowAcc));
            Sender.SetGeneralPostingSetupInventoryAdjmntAccount(
                GetMigrationPostingSetupGroupName(C5InvenItemGroup.Group),
                '',
                C5LedTableMigrator.FillWithLeadingZeros(C5InvenItemGroup.InventoryInflowAcc));
        end;
        if C5InvenItemGroup.InventoryOutflowAcc <> '' then
            Sender.SetGeneralPostingSetupInventoryAdjmntAccount(
                C5InvenItemGroup.Group,
                '',
                C5LedTableMigrator.FillWithLeadingZeros(C5InvenItemGroup.InventoryOutflowAcc));

        Sender.SetInventoryPostingGroup(C5InvenItemGroup.Group);
        Sender.SetGeneralProductPostingGroup(C5InvenItemGroup.Group);
        Sender.ModifyItem(true);
    end;

    local procedure GetMigrationPostingSetupGroupName(Group: Code[10]): Code[20]
    begin
        exit(FakeProductPostingGroupPrefixLbl + Group);
    end;

    /// <summary>
    /// OnMigrateInventoryTransactions.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Item Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    /// <param name="ChartOfAccountsMigrated">Boolean.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Data Migration Facade", OnMigrateInventoryTransactions, '', true, true)]
    local procedure OnMigrateInventoryTransactions(var Sender: Codeunit "Item Data Migration Facade"; RecordIdToMigrate: RecordId; ChartOfAccountsMigrated: Boolean)
    var
        C5InvenTable: Record "C5 2008 InvenTable";
        C5InvenTrans: Record "C5 2008 InvenTrans";
        C5InvenItemGroup: Record "C5 2008 InvenItemGroup";
        C5InvenLocation: Record "C5 2008 InvenLocation";
        C5LedTableMigrator: Codeunit "C5 2008 LedTable Migrator";
        C5HelperFunctions: Codeunit "C5 2008 Helper Functions";
        SerialNumber: Code[20];
        LotNumber: Code[20];
    begin
        if not ChartOfAccountsMigrated then
            exit;
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 InvenTable" then
            exit;

        C5InvenTable.Get(RecordIdToMigrate);
        Sender.CreateItemJournalBatchIfNeeded(GetHardCodedBatchName(), '', '');
        C5InvenItemGroup.SetRange(Group, C5InvenTable.Group);
        C5InvenItemGroup.FindFirst();

        C5InvenTrans.SetRange(ItemNumber, C5InvenTable.ItemNumber);
        C5InvenTrans.SetRange(Open, C5InvenTrans.Open::Yes);
        C5InvenTrans.SetRange(BudgetCode, C5InvenTrans.BudgetCode::Actual);
        C5InvenTrans.SetFilter(Qty, '>%1', 0);
        if C5InvenTrans.FindSet() then
            repeat
                case C5InvenTable.ItemTracking of
                    C5InvenTable.ItemTracking::None:
                        begin
                            LotNumber := '';
                            SerialNumber := '';
                        end;
                    C5InvenTable.ItemTracking::Batch:
                        LotNumber := C5InvenTrans.SerialNumber;
                    C5InvenTable.ItemTracking::"Serial number":
                        SerialNumber := C5InvenTrans.SerialNumber;
                end;
                IF C5InvenTrans.InvenLocation <> '' then begin
                    C5InvenLocation.SetRange(InvenLocation, C5InvenTrans.InvenLocation);
                    C5InvenLocation.FindFirst();
                    Sender.CreateLocationIfNeeded(C5InvenLocation.InvenLocation, C5InvenLocation.Name);
                    Sender.CreateInventoryPostingSetupIfNeeded(C5InvenItemGroup.Group, C5InvenItemGroup.GroupName, C5InvenTrans.InvenLocation);
                    if ChartOfAccountsMigrated then
                        if C5InvenItemGroup.InventoryInflowAcc <> '' then
                            Sender.SetInventoryPostingSetupInventoryAccount(
                                C5InvenItemGroup.Group,
                                C5InvenTrans.InvenLocation,
                                C5LedTableMigrator.FillWithLeadingZeros(C5InvenItemGroup.InventoryInflowAcc));
                end;

                Sender.CreateItemJournalLine(GetHardCodedBatchName(),
                    CopyStr(Format(C5InvenTrans.Voucher), 1, 20),
                    CopyStr(StrSubstNo('%1 %2', C5InvenTrans.InvoiceNumber, C5InvenTrans.Txt), 1, 50),
                    C5InvenTrans.Date_,
                    C5InvenTrans.Qty - C5InvenTrans.SettledQty,
                    C5InvenTrans.CostAmount - C5InvenTrans.SettledAmount,
                    C5InvenTrans.InvenLocation,
                    GetMigrationPostingSetupGroupName(C5InvenItemGroup.Group));
                Sender.SetItemJournalLineItemTracking(SerialNumber, LotNumber);
                Sender.SetItemJournalLineDimension(
                    C5HelperFunctions.GetDepartmentDimensionCodeTxt(),
                    C5HelperFunctions.GetDepartmentDimensionDescTxt(),
                    C5InvenTrans.Department,
                    C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Department", C5InvenTrans.Department));
                Sender.SetItemJournalLineDimension(
                    C5HelperFunctions.GetCostCenterDimensionCodeTxt(),
                    C5HelperFunctions.GetCostCenterDimensionDescTxt(),
                    C5InvenTrans.Centre,
                    C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Centre", C5InvenTrans.Centre));
                Sender.SetItemJournalLineDimension(
                    C5HelperFunctions.GetPurposeDimensionCodeTxt(),
                    C5HelperFunctions.GetPurposeDimensionDescTxt(),
                    C5InvenTrans.Purpose,
                    C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Purpose", C5InvenTrans.Purpose));
            until C5InvenTrans.Next() = 0;
    end;

    local procedure ImportItemInventoryCustomerDiscountsFromStaging(C5InvenTable: Record "C5 2008 InvenTable")
    var
        C5InvenCustDisc: Record "C5 2008 InvenCustDisc";
    begin
        // search for discounts that apply for this item specifically
        C5InvenCustDisc.SetRange(ItemCode, C5InvenCustDisc.ItemCode::Specific);
        C5InvenCustDisc.SetRange(ItemRelation, C5InvenTable.ItemNumber);
        if C5InvenCustDisc.FindSet() then
            repeat
                CreateSalesLineDiscountIfNeeded(C5InvenCustDisc);
            until C5InvenCustDisc.Next() = 0;

        // search for discounts that apply for this item group
        C5InvenCustDisc.SetRange(ItemCode, C5InvenCustDisc.ItemCode::Group);
        C5InvenCustDisc.SetRange(ItemRelation, C5InvenTable.DiscGroup);
        if C5InvenCustDisc.FindSet() then
            repeat
                CreateSalesLineDiscountIfNeeded(C5InvenCustDisc);
            until C5InvenCustDisc.Next() = 0;
    end;

    local procedure ImportItemPricesFromStaging(C5InvenTable: Record "C5 2008 InvenTable")
    var
        C5InvenPrice: Record "C5 2008 InvenPrice";
    begin
        // search for prices that apply to this item specifically
        C5InvenPrice.SetRange(ItemNumber, C5InvenTable.ItemNumber);
        if C5InvenPrice.FindSet() then
            repeat
                CreateNavSalesPriceIfNeeded(C5InvenPrice);
            until C5InvenPrice.Next() = 0;
    end;

#if not CLEAN19
    local procedure CreateSalesLineDiscountIfNeeded(C5InvenCustDisc: Record "C5 2008 InvenCustDisc")
    var
        SalesTypeToSet: Option Customer,"Customer Disc. Group","All Customers",Campaign;
        TypeToSet: Option Item,"Item Disc. Group";
        Priceassettype: Enum "Price Asset Type";
        PriceSourceType: enum "Price Source Type";
    begin
        if C5InvenCustDisc.Type <> C5InvenCustDisc.Type::Percent then
            exit;

        case C5InvenCustDisc.AccountCode of
            C5InvenCustDisc.AccountCode::Specific:
                SalesTypeToSet := SalesTypeToSet::Customer;

            C5InvenCustDisc.AccountCode::Group:
                begin
                    CreateNavCustDiscGroupIfNeeded(C5InvenCustDisc.AccountRelation); // to make sure the group exists
                    SalesTypeToSet := SalesTypeToSet::"Customer Disc. Group";
                end;
            else
                exit;
        end;

        case C5InvenCustDisc.ItemCode of
            C5InvenCustDisc.ItemCode::Specific:
                TypeToSet := TypeToSet::Item;

            C5InvenCustDisc.ItemCode::Group:
                begin
                    CreateItemDiscGroupIfNeeded(C5InvenCustDisc.ItemRelation); // to make sure the group exists
                    TypeToSet := TypeToSet::"Item Disc. Group";
                end;
            else
                exit;
        end;
        // SourceType: Enum "Price Source Type"; SourceNo: Code[20]; AssetType: Enum "Price Asset Type"; AssetNo: Code[20]; MinimumQuantity: Decimal; LineDiscountPercent: Decimal

        Priceassettype := Priceassettype::Item;
        PriceSourceType := PriceSourceType::"Customer";
        UninitializedItemDataMigrationFacade.CreateSalesLineDiscountIfNeeded(
            PriceSourceType,
            C5InvenCustDisc.AccountRelation,
            Priceassettype,
            C5InvenCustDisc.ItemRelation,
            1,
            C5InvenCustDisc.Rate_);
    end;
#else
    local procedure CreateSalesLineDiscountIfNeeded(C5InvenCustDisc: Record "C5 InvenCustDisc")
    var
        SalesTypeToSet: Enum "Price Source Type";
        TypeToSet: Enum "Price Asset Type";
    begin
        if C5InvenCustDisc.Type <> C5InvenCustDisc.Type::Percent then
            exit;

        case C5InvenCustDisc.AccountCode of
            C5InvenCustDisc.AccountCode::Specific:
                SalesTypeToSet := SalesTypeToSet::Customer;

            C5InvenCustDisc.AccountCode::Group:
                begin
                    CreateNavCustDiscGroupIfNeeded(C5InvenCustDisc.AccountRelation); // to make sure the group exists
                    SalesTypeToSet := SalesTypeToSet::"Customer Disc. Group";
                end;
            else
                exit;
        end;

        case C5InvenCustDisc.ItemCode of
            C5InvenCustDisc.ItemCode::Specific:
                TypeToSet := TypeToSet::Item;

            C5InvenCustDisc.ItemCode::Group:
                begin
                    CreateItemDiscGroupIfNeeded(C5InvenCustDisc.ItemRelation); // to make sure the group exists
                    TypeToSet := TypeToSet::"Item Discount Group";
                end;
            else
                exit;
        end;

        UninitializedItemDataMigrationFacade.CreateSalesLineDiscountIfNeeded(
            SalesTypeToSet,
            C5InvenCustDisc.AccountRelation,
            TypeToSet,
            C5InvenCustDisc.ItemRelation,
            C5InvenCustDisc.Rate_,
            0);
    end;
#endif

    local procedure CreateNavCustDiscGroupIfNeeded(C5CustDiscountGroupCode: Code[10])
    var
        C5CustDiscGroup: Record "C5 CustDiscGroup";
        GroupDescription: Text[50];
    begin
        C5CustDiscGroup.SetRange(DiscGroup, C5CustDiscountGroupCode);
        if C5CustDiscGroup.FindFirst() then
            GroupDescription := C5CustDiscGroup.Comment;
        UninitializedItemDataMigrationFacade.CreateCustDiscGroupIfNeeded(C5CustDiscountGroupCode, GroupDescription);
    end;

    local procedure CreateItemDiscGroupIfNeeded(C5DiscountGroupCode: Code[20])
    var
        C5InvenDiscGroup: Record "C5 2008 InvenDiscGroup";
        GroupDescription: Text[50];
    begin
        C5InvenDiscGroup.SetRange(DiscGroup, C5DiscountGroupCode);
        if C5InvenDiscGroup.FindFirst() then
            GroupDescription := C5InvenDiscGroup.Comment;

        UninitializedItemDataMigrationFacade.CreateItemDiscGroupIfNeeded(C5DiscountGroupCode, GroupDescription);
    end;

#if not CLEAN19
    local procedure CreateNavSalesPriceIfNeeded(C5InvenPrice: Record "C5 2008 InvenPrice")
    var
        PriceSourceType: enum "Price Source Type";
    begin
        CreateCustomerPriceGroupIfNeeded(C5InvenPrice.PriceGroup);
        // SourceType: Enum "Price Source Type"; SourceNo: Code[20]; CurrencyCode: Code[10]; StartingDate: Date; AssetNo: Code[20]; VariantCode: Code[10]; UnitOfMeasure: Code[10]; MinimumQuantity: Decimal; UnitPrice: Decimal)
        PriceSourceType := PriceSourceType::"Customer Price Group";
        UninitializedItemDataMigrationFacade.CreateSalesPriceIfNeeded(
            PriceSourceType,
            '',
            C5InvenPrice.Currency,
            0D,
            C5InvenPrice.ItemNumber,
            '',
            '',
            0,
            C5InvenPrice.Price);
    end;
#else
    local procedure CreateNavSalesPriceIfNeeded(C5InvenPrice: Record "C5 InvenPrice")
    var
        SalesType: Enum "Price Source Type";
    begin
        CreateCustomerPriceGroupIfNeeded(C5InvenPrice.PriceGroup);

        UninitializedItemDataMigrationFacade.CreateSalesPriceIfNeeded(
            SalesType::"Customer Price Group",
            C5InvenPrice.PriceGroup,
            C5InvenPrice.Currency,
            0D,
            C5InvenPrice.ItemNumber,
            '', '', 0,
            C5InvenPrice.Price);
    end;
#endif

    local procedure CreateCustomerPriceGroupIfNeeded(C5InvenPriceGroupTxt: Code[10]): Code[10]
    var
        C5InvenPriceGroup: Record "C5 2008 InvenPriceGroup";
        CustomerDataMigrationFacade: Codeunit "Customer Data Migration Facade";
    begin
        if C5InvenPriceGroupTxt = '' then
            exit(C5InvenPriceGroupTxt);

        C5InvenPriceGroup.SetRange(Group, C5InvenPriceGroupTxt);
        if not C5InvenPriceGroup.FindFirst() then
            Error(InventPriceGroupNotFoundErr, C5InvenPriceGroupTxt);

        exit(CustomerDataMigrationFacade.CreateCustomerPriceGroupIfNeeded(
            C5InvenPriceGroup.Group,
            C5InvenPriceGroup.GroupName,
            C5InvenPriceGroup.InclVat = C5InvenPriceGroup.InclVat::Yes));
    end;

    local procedure CreateTariffNoIfNeeded(C5TariffNo: Code[20])
    var
        C5CN8Code: Record "C5 2008 CN8Code";
        SupplementaryUnitsToSet: Boolean;
        DescriptionToSet: Text[50];
    begin
        C5CN8Code.SetRange(CN8Code, C5TariffNo);
        if C5CN8Code.FindFirst() then begin
            DescriptionToSet := C5CN8Code.Txt;
            SupplementaryUnitsToSet := C5CN8Code.SupplementaryUnits <> '';
        end;

        UninitializedItemDataMigrationFacade.CreateTariffNumberIfNeeded(C5TariffNo, DescriptionToSet, SupplementaryUnitsToSet);
    end;

    local procedure CreateUnitCodeIfNeeded(C5UnitCodeTxt: Code[10])
    var
        C5UnitCode: Record "C5 2008 UnitCode";
        DescriptionToSet: Text[10];
    begin
        C5UnitCode.SetRange(UnitCode, C5UnitCodeTxt);
        if C5UnitCode.FindFirst() then
            DescriptionToSet := CopyStr(C5UnitCode.Txt, 1, 10);

        UninitializedItemDataMigrationFacade.CreateUnitOfMeasureIfNeeded(C5UnitCodeTxt, DescriptionToSet);
    end;

    /// <summary>
    /// GetOrCreateItemTrackingCode.
    /// </summary>
    /// <param name="C5OrderTrackingPolicy">Option None,Batch,"Serial number".</param>
    /// <returns>Return value of type Code[10].</returns>
    procedure GetOrCreateItemTrackingCode(C5OrderTrackingPolicy: Option None,Batch,"Serial number"): Code[10]
    begin
        case C5OrderTrackingPolicy of
            C5OrderTrackingPolicy::None:
                exit('');

            C5OrderTrackingPolicy::Batch:
                begin
                    UninitializedItemDataMigrationFacade.CreateItemTrackingCodeIfNeeded(BatchTrackingCodeTxt, BatchTrackingDescriptionTxt, true, false);
                    exit(BatchTrackingCodeTxt);
                end;

            C5OrderTrackingPolicy::"Serial number":
                begin
                    UninitializedItemDataMigrationFacade.CreateItemTrackingCodeIfNeeded(SerialNumberTrackingCodeTxt, SerialNumberTrackingDescriptionTxt, false, true);
                    exit(SerialNumberTrackingCodeTxt);
                end;
        end;
    end;

    local procedure ConvertItemType(C5ItemType: Option Item,Service,BOM,Kit): Option
    begin
        case C5ItemType of
            C5ItemType::BOM,
            C5ItemType::Item,
            C5ItemType::Kit:
                exit(ItemTypeOption::Inventory);
            C5ItemType::Service:
                exit(ItemTypeOption::Service);
        end;
    end;

    local procedure ConvertCostingMethod(C5InvenTable: Record "C5 2008 InvenTable"): Option
    var
        CostingMethod: Option FIFO,LIFO,Specific,Average,Standard;
    begin
        case C5InvenTable.CostingMethod of
            C5InvenTable.CostingMethod::Average:
                exit(CostingMethod::Average);

            C5InvenTable.CostingMethod::FIFO:
                exit(CostingMethod::FIFO);

            C5InvenTable.CostingMethod::LIFO:
                exit(CostingMethod::LIFO);

            C5InvenTable.CostingMethod::"Serial number":
                exit(CostingMethod::Specific);

            C5InvenTable.CostingMethod::"Cost price":
                exit(CostingMethod::Standard);
        end;
    end;

    /// <summary>
    /// GetHardCodedBatchName.
    /// </summary>
    /// <returns>Return value of type Code[10].</returns>
    procedure GetHardCodedBatchName(): Code[10]
    begin
        exit(CopyStr(ItemJournalBatchNameTxt, 1, 10));
    end;
}