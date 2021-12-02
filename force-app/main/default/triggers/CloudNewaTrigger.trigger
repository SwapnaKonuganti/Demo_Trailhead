trigger CloudNewaTrigger on Cloud_News__e (after insert) {
    List<Case> cases= new List<Case>();
    Group queue = [SELECT Id FROM Group WHERE Name='Regional Dispatch' LIMIT 1];

    for(Cloud_News__e SN : Trigger.New){
        if(SN.Urgent__c== true){
            Case cs = new Case();
            cs.Priority='High';
            cs.Subject='New team Dispatch to ' ;
            cs.OwnerId=queue.Id;
            cases.add(cs);
        }
    }
    insert cases;
}