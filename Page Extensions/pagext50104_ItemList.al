pageextension 50104 "CSD Item List" extends "Item List"
{
    layout
    {
        addfirst(factboxes)
        {
            part(Subscription; "CSD Subscription Factbox")
            {
                SubPageLink = "Item No" = field("No.");
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
}