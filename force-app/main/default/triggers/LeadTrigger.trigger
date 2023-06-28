//Some points while working with trigger.
//to check to running context of trigger we have.
//trigger.isBefore --> to check the before trigger is running.
//trigger.isAfter --> to check the After trigger is running.
//trigger.isInsert --> to check the Insert trigger is running.
//trigger.isUpdate --> to check the Update trigger is running.
//trigger.isDelete --> to check the Delete trigger is running.
//
//(trigger.isBefore && trigger.isInsert) --> before insert trigger.
//...
//


// trigger.new --> List<sObject>, here sObject is varies on the basis of the Object for trigger.
// it contains list of records that is just inserted, Updated or undelted
// trigger.old --> List<sObject>, here sObject is varies on the basis of the Object for trigger.
// BUT, it contains list of records that is just before the inserted, Updated.
// trigger.oldMap --> Map<id, sObject> here sObject is varies on the basis of the Object for trigger.
// BUT, it contains list of records that is just before the inserted, Updated.
trigger LeadTrigger on Lead (before update) {
    
    /*
    for(Lead leadObj: trigger.old){
        System.debug('FirstName: ' + leadObj.FirstName);
        System.debug('LastName: ' + leadObj.LastName);
        System.debug('Phone: ' + leadObj.Phone);
    }
    */
    
    /* We will use this type of concept in future for Update trigger.
    for(Lead newLeadObj: trigger.new){
        Lead oldLeadObj = trigger.oldMap.get(newLeadObj.Id);
        
        System.debug('OLD FirstName: ' + oldLeadObj.FirstName);
        System.debug('OLD LastName: ' + oldLeadObj.LastName);
        System.debug('OLD Phone: ' + oldLeadObj.Phone);
        
        System.debug('FirstName: ' + newLeadObj.FirstName);
        System.debug('LastName: ' + newLeadObj.LastName);
        System.debug('Phone: ' + newLeadObj.Phone);
    }
	*/

	if(trigger.isBefore && trigger.isUpdate){// Before Update
        //in our case, this trigger.new is List<Lead>.
        LeadTriggerHelper.beforeUpdate(trigger.new, trigger.oldMap);
    }
    
}