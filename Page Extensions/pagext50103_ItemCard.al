pageextension 50103 "CSD Item Card" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("Subscription Item";Rec."Subscription Item")
            {
                ApplicationArea = All;
            }
        }
        addfirst(factboxes)
        {
            part(Subscription; "CSD Subscription Factbox")
            {
                SubPageLink = "Customer No" = field("No.");
                ApplicationArea = All;
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
                RunPageLink = "Item No" = field("No.");
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