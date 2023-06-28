public class UtilClass {
	
    public static void UpdateContactViaPurchaseInvoice(Set<Id> customerIdSet){
        //When we have to perform sum, min, max or Count then we have to perform a special type of SOQL
        //Query called as aggregate query.
        List<AggregateResult> aggregateResultList = new List<AggregateResult>();
        aggregateResultList = [
            SELECT SUM(Total_Amount_to_Pay__c) totalPay, Customer__c
            FROM Purchase_Invoice__c
            WHERE Customer__c IN :customerIdSet
            GROUP BY Customer__c
        ];
        
        List<Contact> contactList = new List<Contact>();
        for(AggregateResult agrObj :aggregateResultList){
            Contact contactObj = new Contact();
            contactObj.Id = ''+agrObj.get('Customer__c');
            contactObj.Total_Purchase_Amount__c = Decimal.valueOf(''+agrObj.get('totalPay'));
            contactList.add(contactObj);
        }
        
        if(contactList.size() > 0){
            UPDATE contactList;
        }
    }
}