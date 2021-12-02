({
init: function(component, event, helper) {
    var action = component.get("c.getObjectName");
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {           
            var allValues = response.getReturnValue();
            component.set("v.options", allValues);
        }                    
        else if (state === "ERROR") {
            var errors = response.getError();
            if (errors) {
                if (errors[0] && errors[0].message) {
                    console.log("Error message: "+errors[0].message);
                }
            } 
            else {
                console.log("Unknown Error");
            }
        }
    });
    $A.enqueueAction(action);
 },
 
    handleClick: function(component, event, helper)
    {
       console.log('Selected value--->'+component.find("onjId").get("v.value"));
        console.log('Selected value--->'+component.get("v.radioValue"));
        if(!$A.util.isEmpty(component.get("v.radioValue")))
        {
            component.set("v.isModalOpen", true);
        }
        else
        {
            component.set("v.isPicklistOption",true);
        }
        
    },
    closeModel: function(component, event, helper) {
      component.set("v.isModalOpen", false);
      component.set("v.isPicklistOption",false);
   },
  
   submitDetails: function(component, event, helper) {
      console.log('Submitted value--->'+component.find("onjId").get("v.value"));
      var selectedValue=component.find("onjId").get("v.value");
      component.set("v.isModalOpen", false);
      var act = component.get("c.processObjects");
        act.setParams({Objectname:selectedValue});
        act.setCallback(this,function(response){
            var state = response.getState();
            if(state==="SUCCESS"){
                alert("From server"+response.getReturnValue());
            }
            else if(state==="INCOMPLETE"){
                
            }
                else if(state==="ERROR"){
                    var errors=response.getError();
                    if(error){
                        console.log ("Errors"+error);
                        
                    }
                }
        })
        $A.enqueueAction(act);
   },
})