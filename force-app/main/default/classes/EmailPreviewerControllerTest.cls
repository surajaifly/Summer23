@isTest
public class EmailPreviewerControllerTest {
    @isTest
    static void testGetEmailTemplateList() {
        List<EmailTemplate> result = EmailPreviewerController.getEmailTemplateList();
        List<EmailTemplate> qureyEmail = [SELECT Id, Name FROM EmailTemplate WHERE Name = 'Testing'];
        System.assertEquals(1, qureyEmail.size());
    }
    
    @isTest
    static void testGetAllObjectList() {
        List<EmailTemplate> qureyEmail = [SELECT Id, Name FROM EmailTemplate WHERE Name = 'Testing'];
        
        List<EmailPreviewerController.ObjectNameResponse> objectNameList = EmailPreviewerController.getAllObjectList();
        
    }
    
    @isTest
    static void testPreviewEmailTemplate() {
        Contact testContact = new Contact(FirstName = 'John', LastName = 'Doe', Email = 'johndoe@test.com');
        insert testContact;
        List<EmailTemplate> template = [SELECT Id, Name FROM EmailTemplate WHERE Name = 'Testing'];
        Test.startTest();
        String result = EmailPreviewerController.previewEmailTemplate(template[0].Id, testContact.Id);
        Test.stopTest();
    }
    
    @isTest
    static void getNameUniqueFieldTest(){
        Account accObj = new Account(Name = 'abc');
        insert accObj;
        String objName = 'Account';
        Test.startTest();
        List<sObject> records = EmailPreviewerController.getRecords(objName, accObj.Name);
        Test.stopTest();
		system.assertEquals(1, records.size());
        List<sObject> records1 = EmailPreviewerController.getRecords('Case', 'abcd');
    }
    
    public class ObjectNameResponse{
        @AuraEnabled public String value{get;set;}
        @AuraEnabled public String label{get;set;}
    }
}