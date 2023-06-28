//Trigger Best Practices:
// #1:	Never ever have the SOQL in Loop.
// #2: 	Avoid LOOP inside another LOOP or we can say that nested LOOP.
// #3: 	Always design the logic-less trigger, for this we need to 
// 		create a helper class and add the login in the helper or handler class.
// 
// 
// 
/* Requirement:
When the Opportunity Stage is updated to ‘Negotiations’,
THEN
Send an email to the Opportunity Owner.
*/
trigger OpportunityTrigger on Opportunity (after insert, after Update) {
	
    if(trigger.isAfter && trigger.isInsert){// After Insert
        //in our case, this trigger.new is List<Opportunity>.
        OpportunityTriggerHelper.afterInsert(trigger.new);
        
        
    }else if(trigger.isAfter && trigger.isUpdate){// After Update
        //in our case, this trigger.new is List<Opportunity>.
        OpportunityTriggerHelper.afterUpdate(trigger.new, trigger.oldMap);
    }
}