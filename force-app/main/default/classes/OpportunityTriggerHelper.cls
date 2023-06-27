/*
 * 
 * Requirement:
When a Opportunity is Create,
THEN
Need to create a related Task Record, Where
	Subject = ‘New Opportunity’,
	Name = Contact related to the Opportunity’s Account
	Status = ‘Not Started’
	DueDate is 15 Days from NOW.

//Trigger Best Practices:
// #1:	Never ever have the SOQL in Loop.
// #2: 	Avoid LOOP inside another LOOP or we can say that nested LOOP.
// #3: 	Always design the logic-less trigger, for this we need to 
// 		create a helper class and add the login in the helper or handler class.
// #4: 	Never ever have the DML in Loop.
// 
*/
public class OpportunityTriggerHelper {
	
    public static void afterInsert(List<Opportunity> opportunityList){
        
        Set<Id> accountIdSet = new Set<Id>();
        for(Opportunity opportunityObj: opportunityList){
            /*
            Contact contactObj = [
                SELECT Id
                FROM Contact 
                WHERE AccountId = opportunityObj.AccountId
            ];
            */
            accountIdSet.add(opportunityObj.AccountId);
            /*
            Task taskObj = new Task();
            taskObj.Subject 'New Opportunity';
            taskObj.WhoId = NULL; //exctract the contact from related Account's.
            taskObj.Status = 'Not Started';
            taskObj.ActivityDate = System.today().addDays(15);
            
            INSERT taskObj;
			*/
        }
        
        if(accountIdSet.size() > 0){
            List<Contact> contactList = new List<Contact>();
            contactList = [
                SELECT Id, AccountId
                FROM Contact 
                WHERE AccountId IN :accountIdSet
            ];
            
            /*
             * Create a Map, where
             * KEY is the relationship data between the list and the main data, and
             * VALUE is the whole record.
             * 
			*/
            Map<Id, Contact> relatedContactByAccountIdMap = new Map<Id, Contact>();
            for(Contact contactObj :contactList){
                relatedContactByAccountIdMap.put(contactObj.AccountId, contactObj);
            }
            
            List<Task> taskListToInsert = new List<Task>();
            for(Opportunity opportunityObj: opportunityList){
                Contact relatedContact;
                if(relatedContactByAccountIdMap.containsKey(opportunityObj.AccountId)){
                    relatedContact = relatedContactByAccountIdMap.get(opportunityObj.AccountId);
                }
                
                Task taskObj = new Task();
                taskObj.WhatId = opportunityObj.Id;
                taskObj.Subject = 'New Opportunity';
                taskObj.WhoId = relatedContact.Id; //exctract the contact from related Account's.
                taskObj.Status = 'Not Started';
                taskObj.ActivityDate = System.today().addDays(15);
                
                /*
                INSERT taskObj;
				*/
                taskListToInsert.add(taskObj);
            }
            
            if(taskListToInsert.size() > 0){
                INSERT taskListToInsert;
            }
        }
    }
}