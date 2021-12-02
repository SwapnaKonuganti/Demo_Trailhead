({
	restAPIcalls :function(component, event)  {
        var action = component.get("c.getobjectslist");
        action.setParams({"Product2Id" : component.get("v.selectRecordId")});
        action.setCallback(this, function(response){
            var STATE = response.getState();
            if(STATE === "SUCCESS") {
               console.log("success");
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                    errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
       });
        
        $A.enqueueAction(action);
		
	}
})