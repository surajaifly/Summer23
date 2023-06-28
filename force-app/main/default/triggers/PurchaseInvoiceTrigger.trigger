/*
 * Requirement:
 * When the Purchase invoice have amount populated, 
 * THEN
 * Update the Total Amount on the Related Contact.
 * */
trigger PurchaseInvoiceTrigger on Purchase_Invoice__c (After Update, After Delete) {
	
    if(trigger.isAfter && trigger.isUpdate){// After Update
        //in our case, this trigger.new is List<Purchase_Invoice__c>.
        PurchaseInvoiceTriggerHelper.afterUpdate(trigger.new, trigger.oldMap);
        
    }else if(trigger.isAfter && trigger.isDelete){// After Update
        //in our case, this trigger.old is List<Purchase_Invoice__c>.
        PurchaseInvoiceTriggerHelper.afterDelete(trigger.old);
    }
}