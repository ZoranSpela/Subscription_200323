pageextension 50101 "CSD Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Subscription Customer";Rec."Subscription Customer")
            {
                ApplicationArea = All;
            }
        }
        addfirst(factboxes)
        {
            part(Subscription; "CSD Subscription Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Customer No" = field("No.");
            }
        }
    }
    
    actions
    {
        addlast(navigation)
        {
            action(Subcriptions)
            {
                Caption = 'Subscription';
                RunObject = page "CSD Customer Subscription";
                RunPageLink = "Customer No" = field("No.");
                ApplicationArea = All;
                Image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }
    
    var
        myInt: Integer;
}