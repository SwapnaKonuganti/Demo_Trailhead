({
	echo : function(component) {
		var act = component.get("c.servierside");
        act.setParams({fname:component.get("v.fname")});
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
                        
	}
})