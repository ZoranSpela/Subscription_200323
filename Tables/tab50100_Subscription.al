table 50100 "CSD Subscription"
{
    Caption = 'Subscription';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1;Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(4; "Invoicing Schedule"; Option)
        {
            Caption = 'Invoicing Schedule';
            DataClassification = CustomerContent;
            OptionMembers = "Posting Date","Beginning of Period","End of Period","Beginning of Next Period";
            OptionCaption = 'Posting Date,Beginning of Period,End of Period,Beginning of Next Period';
        }
        field(5; "Invoicing Frequence"; DateFormula)
        {
            Caption = 'Invoicing Frequence';
            DataClassification = CustomerContent;
        }
        field(6; "Invocing Price"; Decimal)
        {
            Caption = 'Invocing Price';
            DataClassification = CustomerContent;
        }
        field(7; "Deferral Code"; Code[10])
        {
            Caption = 'Deferral Code';
            DataClassification = CustomerContent;
            TableRelation = "Deferral Template";
        }
    }
    
    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
    
}