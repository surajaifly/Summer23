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
// 


/*
 * 	Requirement: 
When a contact record in inserted, 
THEN, If Phone is Blank
AND Contact is Associated with Account,
THEN, Get Phone from it’s Related account and populated the Contact’s phone number.

*/
//Trigger Best Practices:
// #1:	Never ever have the SOQL in Loop.
// #2: 	Avoid LOOP inside another LOOP or we can say that nested LOOP.
// #3: 	Always design the logic-less trigger, for this we need to 
// 		create a helper class and add the login in the helper or handler class.
// 
// 

trigger ContactTrigger on Contact (before insert) {
	
    if(trigger.isBefore && trigger.isInsert){// Before Insert
        //in our case, this trigger.new is List<Contact>.
        ContactTriggerHandler.beforeInsert(trigger.new);
    }
}