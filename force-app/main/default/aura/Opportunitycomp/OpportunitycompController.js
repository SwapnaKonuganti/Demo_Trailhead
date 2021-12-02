({
	oppget : function(component) {
        var act = component.get("c.getopportunity");
        act.setCallback(this,function(response){
            var state = response.getState();
            if(state==="SUCCESS"){
                component.set("v.opportunity",response.getReturnValue());
            }
        });
        $A.enqueueAction(act);
		
	}
})