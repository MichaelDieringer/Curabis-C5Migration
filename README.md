# C5-2008-BC
Tool to convert C5 2008 to Business Central

Extended and stabilized compared to Microsofts C5 2012 tool. 

Pre installment conditions:

1.) Enabling of Sales Price Experience in Feature Management







// diverse rettelser:

Codeunit "C5 2008 Helper Functions"
Mindre restriktiv håndtering af Postnr. og By - tjek hvor kombinationen skal eksistere er fjernet.
søg efter PostCodeOrCityNotFoundErr i codeunit for at aktivere funktionen. 

Codeunit "C5 2008 Item Migrator"
den alternative varenummer er ikke nødvendigvis brugt som en erstattningsvare men mere som en leverandørvare 
så det er ikke nødvendigvis en fejl at den ikke findes
Søg efter C5InvenTable.AltItemNumber for at aktivere funktionaliteten
 