tableextension 50101 "CSD Item Ext" extends Item
{
    fields
    {
        // Add changes to table fields here
        field(50100; "Subscription Item"; Boolean)
        {
            Caption = 'Subscription Item';
            FieldClass = FlowField;
            CalcFormula = exist("CSD Customer Subscription" where ("Item No" = field("No.")));
            Editable = false;
        }
    }
}