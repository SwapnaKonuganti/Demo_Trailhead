({
    handleOnSuccess : function(component, event, helper) 
    {
        var workorderRecord = event.getParam("response").id;
        console.log(workorderRecord);
        component.set("v.messages","The new workOrder : "+ workorderRecord +" has been updated successfully.");
    }
})