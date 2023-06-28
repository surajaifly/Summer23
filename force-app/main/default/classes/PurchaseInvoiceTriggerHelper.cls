public class PurchaseInvoiceTriggerHelper {
	
    public Static void afterUpdate(List<Purchase_Invoice__c> newPurchaseInvList, Map<id, Purchase_Invoice__c> oldPurchaseInvByIdMap){
        
        Set<Id> customerIdSet = new Set<Id>();
        for(Purchase_Invoice__c newPurchaseInvObj :newPurchaseInvList){
            Purchase_Invoice__c oldPurchaseInvObj = oldPurchaseInvByIdMap.get(newPurchaseInvObj.Id);
            //Check the amount is changed.
            if(newPurchaseInvObj.Total_Amount_to_Pay__c != oldPurchaseInvObj.Total_Amount_to_Pay__c){
                //Capture all Ids, because we can't do Update in LOOP.
                customerIdSet.add(newPurchaseInvObj.Customer__c);
            }
        }
        
        if(customerIdSet.size() > 0){
            UtilClass.UpdateContactViaPurchaseInvoice(customerIdSet);
        }
    }

	
    public Static void afterDelete(List<Purchase_Invoice__c> oldPurchaseInvList){
        
        Set<Id> customerIdSet = new Set<Id>();
        for(Purchase_Invoice__c newPurchaseInvObj :oldPurchaseInvList){
            customerIdSet.add(newPurchaseInvObj.Customer__c);
        }
        if(customerIdSet.size() > 0){
            UtilClass.UpdateContactViaPurchaseInvoice(customerIdSet);
        }
    }
}