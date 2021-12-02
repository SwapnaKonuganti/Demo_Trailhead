/**
* @author Swapna Konuganti
* @description : WorkOrder Trigger that will contain custom logic.
*/ 

trigger WorkOrderTrigger on WorkOrder (after update, after insert) 
{
    //After Insert and After Update
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        WorkOrderTriggerhandler WorkOrderTriggerhandlerObj = new WorkOrderTriggerhandler  ();
        WorkOrderTriggerhandlerObj.afterinsert (Trigger.new);
    }
}