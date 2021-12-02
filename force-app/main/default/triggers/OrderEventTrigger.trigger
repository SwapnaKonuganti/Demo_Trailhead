trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<Task> Tasks= new List<Task>();
    for(Order_Event__e OE : Trigger.New){
        if(OE.Has_Shipped__c== true){
            Task TK = new Task();
            TK.Priority='Medium';
            TK.Status='New';
            TK.Subject='Follow up on shipped order ' +OE.Order_Number__c;
            TK.OwnerId = UserInfo.getUserId();
            Tasks.add(TK);
        }

        
    }
	Insert Tasks;
}