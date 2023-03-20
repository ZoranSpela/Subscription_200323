pageextension 50102 "CSD Customer List" extends "Customer List"
{
    layout
    {
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
                RunPageLink = "Customer No" = field("No.");
                ApplicationArea = All;
                Image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }
}