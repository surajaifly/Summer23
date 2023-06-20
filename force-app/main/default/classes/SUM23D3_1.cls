public Inherited Sharing class SUM23D3_1 {
	
    Public static List<Purchase_Invoice__c> getPurchaseInvoices(){
        return [
            SELECT Id, Name, Customer__c, Customer__r.Name, Total_Amount_to_Pay__c , Total_Quantity_Sold__c 
            FROM Purchase_Invoice__c
        ];
    }
}