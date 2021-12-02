({
	handleEvent : function(component, event) {
        var numeOfValue = component.get("v.val");
        console.log("current value",numeOfValue);	
        var target;
        if(event.getSource){
            target=event.getSource();
            component.set("v.val",target.get("v.label"));
        }
        else{
            target=event.target.value;
            component.set("v.val",event.target.value+*****);
            
        }
		
	}
})