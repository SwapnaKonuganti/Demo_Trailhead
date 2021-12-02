({
	handleclick : function(component, event) {
		var attributeVal= component.get("v.text");
        var target;
        if(event.getSource){
            target=event.getSource();
            component.set("v.text",target.get("v.label"));
        }
        else{
            target=event.target.value;
            component.set("v.text",event.target.value);
        }
	}
})