report 50100 "CSD Create Invoices"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Create Subscription invoices';
    ProcessingOnly = true;
    
    dataset
    {
        dataitem(CustSubscription;"CSD Customer Subscription")
        {
            RequestFilterFields = "Customer No", "Subscription Code";
            DataItemTableView = where (Active = const(true));

            trigger OnPreDataItem()
            begin
                if not Confirm(CreateWarningTxt) then
                    CurrReport.Quit();
                CustSubscription.SetFilter("Next Invoicing Date", '<=%1', WorkDate());

            end;

            trigger OnAfterGetRecord()
            var
                OldCustomerNo: Code[20];
                OldInvoicingDate: Date;
                SalesHeader: Record "Sales Header";
                SalesLine: Record "Sales Line";
                NextLineNo: Integer;
            begin
                //Test if the invoice has already been made
                SalesLine.Reset();
                SalesLine.SetRange("Document Type", SalesLine."Document Type"::Invoice);
                SalesLine.SetRange("Sell-to Customer No.", CustSubscription."Customer No");
                SalesLine.SetRange(Type, SalesLine.Type);
                SalesLine.SetRange("No.", CustSubscription."Item No");
                SalesLine.SetRange("Posting Date", CustSubscription."Next Invoicing Date");
                If not SalesLine.IsEmpty() then
                    CurrReport.Skip();

                if (OldCustomerNo <> CustSubscription."Customer No") or (OldInvoicingDate <> "Next Invoicing Date") then
                begin
                    //Create invoice header
                    OldInvoicingDate := CustSubscription."Next Invoicing Date";
                    OldCustomerNo := CustSubscription."Customer No";
                    SalesHeader.Init();
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
                    SalesHeader.Insert(true);
                    SalesHeader.Validate("Sell-to Customer No.", CustSubscription."Customer No");
                    SalesHeader.Validate("Location Code", '');
                    SalesHeader.Validate("Document Date", CustSubscription."Next Invoicing Date");
                    SalesHeader.Validate("Posting Date", CustSubscription."Next Invoicing Date");
                    SalesHeader.Modify(true);
                    NextLineNo := 0;
                    InvoiceCount += 1;
                end;
                SalesLine.Init();
                SalesLine."Document Type" := SalesHeader."Document Type";
                SalesLine."Document No." := SalesHeader."No.";
                NextLineNo += 10000;
                SalesLine."Line No." := NextLineNo;
                SalesLine.Validate("Sell-to Customer No.", CustSubscription."Customer No");
                SalesLine.Insert(true);
                
                SalesLine.Type := SalesLine.Type::Item;
                SalesLine.validate("No.", CustSubscription."Item No");
                SalesLine.Validate(Quantity);
                SalesLine.Validate("Allow Line Disc.", CustSubscription."Allow Line Discount");
                SalesLine.Validate("Unit Price", CustSubscription."Invoicing Price");
                SalesLine.Modify();
            end;

            trigger OnPostDataItem()
            var
                IncCounterTxt: label 'Total No. of invoices created %1';
            begin
                Message(IncCounterTxt, InvoiceCount);
            end;
        }
    }
    

    var
        CreateWarningTxt: label 'Create invoices for all active subscptions';
        InvoiceCount: Integer;
}