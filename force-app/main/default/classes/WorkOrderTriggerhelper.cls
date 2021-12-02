/**
* @author Swapna Konuganti
* @description WorkOrderTriggerhelper, this is Helper Class for WorkOrder Object
*/ 
public class WorkOrderTriggerhelper {
    
    /**
    * @description This Method will update OwnerId on WorkOrder.
    * @param newworkOrders List of New WorkOrders that are created and updated OwnerId.
    */ 
    public void updateWorkOrderOwner(List<Workorder> newworkOrders)
    {
        Map<workOrder,Id> workOrderCountry=new Map<workOrder,Id>();
        Map<Id,Id> regionCountry = new Map<Id,Id>();
        List<WorkOrder> newworder = new List<WorkOrder>();  
        boolean isError=false;
        for(Workorder wo:newworkOrders)
        {
            workOrderCountry.put(wo,wo.Country__c);
        }
        
        if(!workOrderCountry.values().isEmpty())
        {
            List<Country__c> country=[Select Id,Name,Region_Country__c,Region_Country__r.User__c From Country__c where Id IN:workOrderCountry.values()];
            
            if(country.size()>0)
            {
                for(Country__c ctry:country)
                {
					regionCountry.put(ctry.Id,ctry.Region_Country__r.User__c);
                }
            }
        }
             
        If(!regionCountry.isEmpty())
        {
            for(WorkOrder worder: workOrderCountry.keySet())
            {
                if(regionCountry.containsKey(workOrderCountry.get(worder)))
                {
                    if(worder.OwnerId != regionCountry.get(workOrderCountry.get(worder)))
                    {
                        workOrder newworkorder = new workOrder(Id=worder.Id, OwnerId=regionCountry.get(workOrderCountry.get(worder)));
                     	newworder.add(newworkorder);    
                    }
                                                     
                }
            }
        }
        
        if(!newworder.isEmpty())
        {
            try
            {
                update newworder;
            }
            catch(Exception e)
            {
                System.debug('user assigned to the region country not system admin');
                /*for(Workorder wo:newworkOrders)
        		{
               		wo .addError('user assigned to the region country not system admin'); 
                }*/
            
        }
        }
    }
}