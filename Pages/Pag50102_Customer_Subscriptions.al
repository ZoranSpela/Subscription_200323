page 50102 "CSD Customer Subscription"
{
    Caption = 'Customer Subscription';
    PageType = List;
    SourceTable = "CSD Customer Subscription";
    UsageCategory = Lists;
    Editable = true;
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                Caption = 'General';
                field("Customer No";Rec."Customer No")
                {
                    ApplicationArea = All;
                    Visible = ShowCustomerNo;
                }
                field("Subscription Code";Rec."Subscription Code")
                {
                    ApplicationArea = All;
                }
                field("Item No";Rec."Item No")
                {
                    ApplicationArea = All;
                }
                field("Start Date";Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("Last Invoice Date";Rec."Last Invoice Date")
                {
                    ApplicationArea = All;
                }
                field("Next Invoicing Date";Rec."Next Invoicing Date")
                {
                    ApplicationArea = All;
                }
                field("Cancelled Date";Rec."Cancelled Date")
                {
                    ApplicationArea = All;
                }
                field(Active;Rec.Active)
                {
                    ApplicationArea = All;
                }
                field("Invoicing Price";Rec."Invoicing Price")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        ShowCustomerNo := (Rec.GetFilter("Customer No") = '');
    end;

    var
        [InDataSet]
        ShowCustomerNo: Boolean;
}