global class DemoBatchClass implements Database.Batchable<sObject>,database.Allowscallouts{

    global database.QueryLocator start(database.batchableContext bc){
    return database.getQueryLocator('select id,Name from Account');
    }
    global void execute(database.batchableContext bc, List<Account> scope){
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint('http://api.androidhive.info/pizza/?format=xml');
        req.SetMethod('GET');
        
        HTTP http1= new HTTP();
        HTTPResponse response = http1.send(req);
        
        String res=response.getBody();
    }
    global void finish(database.batchableContext bc){
    }
    
}