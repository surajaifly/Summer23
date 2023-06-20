public class EmailTemplatePreviewController {
    @AuraEnabled(cacheable=true)
    public static Wrapper getEmailTemplate(String emailTemplateId,String recordID){
        Wrapper obj = new Wrapper();
        list<EmailTemplate> temlIST = [SELECT Id, Name, Body, HtmlValue, Subject, FolderName, FolderId FROM EmailTemplate WHERE Id =:emailTemplateId  LIMIT 1];
         obj.name=temlIST[0].Name;
         obj.subject=temlIST[0].Subject;
         
        List<String> body= new List<String>();
        body.add(temlIST[0].Body);
        Contact conId=[Select Id From Contact LIMIT 1];
        List<Messaging.RenderEmailTemplateBodyResult> results = Messaging.renderEmailTemplate(conId.Id, recordID,body);
        for(Messaging.RenderEmailTemplateBodyResult result:  results){
             obj.body=result.getMergedBody();
        }
        return obj;
    }
    public class Wrapper {
        @AuraEnabled public String name {get; set;}
        @AuraEnabled public String subject {get; set;}
        @AuraEnabled public String body {get; set;}
        
        Wrapper(){
            
        }
        public Wrapper(String name, String subject, String body) {
            name = name;
            subject=subject;
            body=body;
        }
    }
}