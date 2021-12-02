global class LeadProcessor implements Database.Batchable<sobject>, Database.stateful {

global Database.QueryLocator start(Database.BatchableContext bc){
    return Database.getQueryLocator([SELECT LeadSource FROM Lead]);
}

global void execute(Database.BatchableContext bc, List<Lead> scope){
    List<Lead> lead= new List<Lead>();
    for(Lead L: scope){
        L.LeadSource='Dreamforce';
    }
    update scope;
    
}

global void finish(Database.BatchableContext bc){

}
}