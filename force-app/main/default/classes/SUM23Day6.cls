//SOQL with LIST, and MAP
//sObject.
public class SUM23Day6 {
    public SUM23Day6(){
  		
        //SOQL
        //SELECT comma_seleperated_FieldNames FROM sObject_Name WHERE condition LIMIT number.
        //
        //List<Datatype> listName = new List<Datatype>();
        //
        //Map<Datatype, Datatype> mapName = new Map<Datatype, Datatype>();
        
        
        //SELECT firstName, LastName, Email FROM Contact WHERE Email != NULL.
        //
        List<Contact> contactList = new List<Contact>();
        contactList = [SELECT firstName, LastName, Email FROM Contact WHERE Email != NULL];
        
        //short-form --Single line decleration and initialisation.
        List<Contact> contactList_shorForm =  [SELECT firstName, LastName, Email FROM Contact WHERE Email != NULL];
        
        //Requirement:
        //On contact 
        //WHEN Lead Source is 'Other'
        //AND Other Address is Blank, 
        //THEN
        //Copy the Mailing Address to the Other Address.
        //
        
        List<Contact> otherContactList = new List<Contact>();
        otherContactList = [SELECT LeadSource, Phone, MailingStreet, MailingCity, MailingCountry
                           	FROM Contact 
                           	WHERE LeadSource = 'Other'
                          	AND OtherStreet = NULL]; // NULL means Blank.
        
        /**
         * 
         * 	for(datatype_same_as_List variableName :ListName){
        
        	}
         * 
		*/
        for(Contact contactObj :otherContactList){
            //Example:
            System.debug('Phone: ' + contactObj.Phone);
            
            contactObj.OtherStreet = contactObj.MailingStreet;
            contactObj.OtherCity = contactObj.MailingCity;
        }
        
        UPDATE otherContactList;
        
    }
}