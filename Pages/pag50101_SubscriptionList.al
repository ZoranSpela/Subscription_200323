page 50101 "CSD Subscription List"
{
    Caption = 'Subscription List';
    PageType = List;
    ApplicationArea = All;
    SourceTable = "CSD Subscription";
    Editable = false;
    UsageCategory = Lists;
    CardPageId = "CSD Subscription Card";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field(Code;Rec.Code )
                {
                    ApplicationArea = All;
                    
                }
                field(Name;Rec.Name )
                {
                    ApplicationArea = All;
                    
                }
                field("Item No.";Rec."Item No." )
                {
                    ApplicationArea = All;
                    
                }
                field("Invoicing Schedule";Rec."Invoicing Schedule" )
                {
                    ApplicationArea = All;
                    
                }
                field("Invoicing Frequence";Rec."Invoicing Frequence" )
                {
                    ApplicationArea = All;
                    
                }
                field("Invocing Price";Rec."Invocing Price" )
                {
                    ApplicationArea = All;
                    
                }
            }
        }
    }
}