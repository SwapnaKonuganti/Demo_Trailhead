/**
* @author Swapna Konuganti
* @description : Triggerhandler class that will be called from trigger named - WorkOrderTriggerhandler.
**/ 
public class WorkOrderTriggerhandler 
{
    /**
     * @description This Method is after Insert will pass the attributes to helper classes
	 * to create a WorkOrder and to update the OwnerId.
     * @param newList List of new version of sobject records
     **/
    
	 public void afterinsert (List<WorkOrder> triggernew) {
        WorkOrderTriggerhelper helperObj = new WorkOrderTriggerhelper ();
        helperObj.updateWorkOrderOwner(triggernew); 
    }
}