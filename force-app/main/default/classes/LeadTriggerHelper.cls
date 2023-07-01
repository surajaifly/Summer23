/*
 * Requirement:
When a Lead is Update to “working Contacted’
AND
Lead Source is ‘Phone Inquiry’
THEN
If the Phone is Blank, then Update at the end of  the Lead’s Description with 
“Invalid Lead: Phone is Blank.”

*/

//Trigger Best Practices:
// #1:	Never ever have the SOQL in Loop.
// #2: 	Avoid LOOP inside another LOOP or we can say that nested LOOP.
// #3: 	Always design the logic-less trigger, for this we need to 
// 		create a helper class and add the login in the helper or handler class.
// #4: 	Never ever have the DML in Loop.
// #5: 	In case of the Update Trigger, use trigger.new and trigger.oldMap to compare field values
// 		to check the exact Update.
// 

public class LeadTriggerHelper {

    public static void beforeUpdate(List<Lead> leadList, Map<id, Lead> oldLeadByIdMap){
        
        for(Lead newLeadObj: leadList){
            Lead oldLeadObj = oldLeadByIdMap.get(newLeadObj.Id);
            
            if(newLeadObj.Status != oldLeadObj.Status 
               && newLeadObj.Status == 'Working - Contacted' 
               && newLeadObj.LeadSource == 'Phone Inquiry'){
                   
                if(newLeadObj.Phone == NULL){
                    newLeadObj.Description = newLeadObj.Description + ' INVALID LEAD: PHONE IS BLANK';
                }
            }
        }
    }
}