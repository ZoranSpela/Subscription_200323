codeunit 50100 "CSD SubscriptionMgt"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure UpdateSubscriptionInformationOnAfterPostSalesDoc(SalesInvHdrNo: Code[20])
    var
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";
        CustSubscription: Record "CSD Customer Subscription";
        Subscription: Record "CSD Subscription";
    begin
        SalesInvLine.SetRange("Document No.", SalesInvHdrNo);
        SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
        if SalesInvLine.FindSet() then
        repeat
            CustSubscription.setRange("Customer No", SalesInvLine."Sell-to Customer No.");
            CustSubscription.SetRange("Item No", SalesInvLine."No.");
            CustSubscription.SetRange("Next Invoicing Date", SalesInvLine."Posting Date");
            if CustSubscription.FindFirst() then
            begin
                Subscription.Get(CustSubscription."Subscription Code");
                CustSubscription."Last Invoice Date" := SalesInvLine."Posting Date";
                CustSubscription."Next Invoicing Date" := CalcDate(Subscription."Invoicing Frequence", CustSubscription."Next Invoicing Date");
                CustSubscription.Modify();
            end;
        until SalesInvLine.Next() = 0;
    end;

    
}