namespace CurabisC5.CurabisCMigration;

xmlport 51874 "C5 ItemTrackGroup"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'ItemTrackGroupDocument';
            tableelement(C5ItemTrackGroup; "C5 ItemTrackGroup")
            {
                fieldelement(Group; C5ItemTrackGroup.Group) { }
                fieldelement(Prefix; C5ItemTrackGroup.Prefix) { }
                fieldelement(NumberSeries; C5ItemTrackGroup.NumberSeries) { }
                fieldelement(PostFix; C5ItemTrackGroup.PostFix) { }
                fieldelement(BOMUpdate; C5ItemTrackGroup.BOMUpdate) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5ItemTrackGroup.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

