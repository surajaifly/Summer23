/********
@auther : Suraj Kumar Singh
@description    : This is the controller class for the EmailPreviewer LWC component
**********/


public class EmailPreviewerController {
    
    @AuraEnabled(cacheable=true)
    public static List<EmailTemplate> getEmailTemplateList() {
        try{
            String queryString = 'SELECT Id, Name, DeveloperName, FolderId, FolderName FROM EmailTemplate';
            return (List<EmailTemplate>)Database.query(queryString);
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    
    @AuraEnabled(cacheable=true)
    public static List<ObjectNameResponse> getAllObjectList(){
        List<ObjectNameResponse> objectNameList =  new List<ObjectNameResponse>();
        
        Map<String, ObjectNameResponse> objectByNameMap = new Map<String, ObjectNameResponse>();
        
        Schema.DescribeFieldResult fieldResult = EmailTemplate.RelatedEntityType.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            ObjectNameResponse obj = new ObjectNameResponse();  
            obj.value =  pickListVal.getValue();
            obj.label =  pickListVal.getValue();
            if(pickListVal.getLabel() != NULL){
                obj.label =  pickListVal.getLabel();
            }
            objectByNameMap.put(obj.label, obj);
        }     
        
        List<String> tempObjectNameList = new List<String>(objectByNameMap.keySet());
        tempObjectNameList.sort();
        for(String objName :tempObjectNameList){
            objectNameList.add(objectByNameMap.get(objName));
        }
        return objectNameList;
    }
    
    
    private static String getNameUniqueField(String objectName){
        String strResult = null;
        strResult = returnMethod(objectName, true, false , false);
        if(STRING.ISNOTBLANK(strResult)) { return strResult; }
        
        strResult = returnMethod(objectName, false, true , false);
        if(STRING.ISNOTBLANK(strResult)){ return strResult; }
        
        strResult = returnMethod(objectName, false, false , true);
        if(STRING.ISNOTBLANK(strResult)){ return strResult; }
        
        return strResult;
        
    }
    
    private static String returnMethod(String objectName, boolean isName, boolean isAutoNumber, boolean isUnique){
        String strResult = 'Id';
        Map<String, Schema.SObjectField> desResultMap = Schema.getGlobalDescribe().get(objectName).getDescribe().Fields.getMap();
        for(Schema.SObjectField objField : desResultMap.values()){
            Schema.DescribeFieldResult dfr = objField.getDescribe();
            System.debug('queryString' + dfr.getName());
            if(dfr.isAccessible()){
                if(dfr.isNameField() && isName){ strResult = dfr.getName(); break; }
                if(dfr.isAutoNumber() && isAutoNumber){ strResult = dfr.getName(); break; }
                if(dfr.isUnique() && isUnique){ strResult = dfr.getName(); break; }
            }
            
        }
        return strResult;
    }
    
    public class ObjectNameResponse{
        @AuraEnabled public String value{get;set;}
        @AuraEnabled public String label{get;set;}
    }
    
    @AuraEnabled(cacheable=true)
    public static List<sObject> getRecords(String objName, String searchStr){
        try{
            String queryString = 'SELECT ' + getNameUniqueField(objName);
            queryString += ' FROM ' + objName;
            if(String.ISNOTBLANK(searchStr)){
                searchStr = '%' + searchStr + '%';
                queryString += ' WHERE ' + getNameUniqueField(objName) + ' LIKE :searchStr';
            }
            queryString += ' ORDER BY ' + getNameUniqueField(objName) + ' ASC ';
            queryString += ' LIMIT 5';
            
            return Database.query(queryString);
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage()); 
        }
    }   
    
    @AuraEnabled(cacheable=true)
    public static String previewEmailTemplate(String templateId, String whatId){
        try{
            String queryString = 'SELECT Id from Contact LIMIT 1';
            List<Contact> contactList = (List<Contact>) Database.query(queryString);
            if(!contactList.isEmpty()){
                
                return JSON.serialize(Messaging.renderStoredEmailTemplate(templateId, contactList[0].Id, whatId));
            }
            return NULL;
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage()); 
        }
    }
    
    
    
}