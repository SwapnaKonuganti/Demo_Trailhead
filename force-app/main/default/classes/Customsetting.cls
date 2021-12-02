public class Customsetting implements Database.Batchable<Sobject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        return null;
    }
    public void execute(Database.BatchableContext batchcon,List<Sobject> lstobject){
        samplelist__c cs=new samplelist__c();
        cs.name='testing';
        insert cs;
    }
    public void finish(Database.BatchableContext batchcont){
        
    }
    
	
}