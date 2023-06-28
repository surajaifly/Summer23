public class SUM23Day6_2 {
	
    public SUM23Day6_2(){
        //SOQL
        //SELECT comma_seleperated_FieldNames FROM sObject_Name WHERE condition LIMIT number.
        //
        //List<Datatype> listName = new List<Datatype>();
        //
        //Map<Datatype, Datatype> mapName = new Map<Datatype, Datatype>();
        //
        
        //Requirement:
        //For Lead Record if
        //we have contact having matching email Address
        //then
        //Mark the Lead's Possible Duplicate = true.
        //
        
        List<Lead> leadList = new List<Lead>();
        List<Contact> contactList = new List<Contact>();
        Map<String, Boolean> possibleDuplicateByEmailMap = new Map<String, Boolean>();
        
        leadList = [SELECT Email FROM Lead WHERE Email != NULL];
        
        for(Lead leadObj :leadList){
            possibleDuplicateByEmailMap.put(leadObj.Email, false);
        }
        
        
        contactList = [SELECT Email FROM Contact WHERE Email = :possibleDuplicateByEmailMap.keySet()];
        
        for(Contact contactObj :contactList){
            possibleDuplicateByEmailMap.put(contactObj.Email, true);
        }
        
        
        for(Lead leadObj :leadList){
            leadObj.Possible_Duplicate__c = possibleDuplicateByEmailMap.get(leadObj.Email);
        }
        
        UPDATE leadList;
    }
}