public class SUM23BatchClass implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
    	String queryStr = 'SELECT Id, LeadSource from Lead';
        return Database.getQueryLocator(queryStr);
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> leadList){
        // process each batch of records
        // 
        for(Lead leadObj :leadList){
            if(leadObj.LeadSource == NULL){
                leadObj.LeadSource = 'Web';
            }
        }
        UPDATE leadList;
    }
    
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        // Send Email.
    }
}