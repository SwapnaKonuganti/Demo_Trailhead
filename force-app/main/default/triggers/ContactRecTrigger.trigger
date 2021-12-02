trigger ContactRecTrigger on Contact (after update) {

    if(trigger.isAfter){
        if(trigger.isUpdate){
            new conHandler().AccUpdate(Trigger.new);

            }
        }
    }