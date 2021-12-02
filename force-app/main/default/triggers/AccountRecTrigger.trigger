trigger AccountRecTrigger on Account (after update) {
    
    if(trigger.isAfter){
        if(trigger.isUpdate){
            if (Acchandler.isFirstTrigger){
                Acchandler.isFirstTrigger=False;
                new Acchandler().contactAddree(Trigger.new);
            }
        }
    }

}