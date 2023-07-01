public class ContactTriggerHandler {

    public static void beforeInsert(List<Contact> contactList){
        Set<Id> accountIdSet = new Set<Id>();
        for(Contact contactObj :contactList){
            if(contactObj.Phone == NULL && contactObj.AccountId != NULL){
                /*
                //Get Phone from it’s Related account
                Account relatedAccount = [
                    SELECT Phone
                    FROM Account 
                    WHERE Id =: contactObj.AccountId
                ];
                //Populated the phone number
                contactObj.Phone = relatedAccount.Phone;
				*/
                
                accountIdSet.add(contactObj.AccountId);
            }
        }
        
        if(accountIdSet.size() > 0){
            //Get Phone from it’s Related account
            List<Account> accountList = new List<Account>();
            accountList = [
                SELECT Phone
                FROM Account 
                WHERE Id IN :accountIdSet
            ];
            
            /*
            for(Contact contactObj :trigger.new){
                if(contactObj.Phone == NULL && contactObj.AccountId != NULL){
                    for(Account relatedAccount :accountList){
                        if(relatedAccount.Id == contactObj.AccountId){
                            //Populated the phone number
                            contactObj.Phone = relatedAccount.Phone;
                        }
                        
                    }
                }
            }
here, we loop is inside the another loop, so its voilets the best practices of trigger.
			*/
            
            /*
             * Create a Map, where
             * KEY is the relationship data between the list and the main data, and
             * VALUE is the whole record.
             * 
			*/
            Map<Id, Account> relatedAccountByIdMap = new Map<Id, Account>();
            for(Account relatedAccount :accountList){
                relatedAccountByIdMap.put(relatedAccount.Id, relatedAccount);
            }
            
            for(Contact contactObj :contactList){
                if(contactObj.Phone == NULL && contactObj.AccountId != NULL){
                    if(relatedAccountByIdMap.containsKey(contactObj.AccountId)){
                        //Get Phone from it’s Related account
                        Account relatedAccount = relatedAccountByIdMap.get(contactObj.AccountId);
                        
                        //Populated the phone number
                		contactObj.Phone = relatedAccount.Phone;
                    }
                }
            }
            
        }
    }
}