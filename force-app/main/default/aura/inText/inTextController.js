({
	getNumbers : function(component, event) {
		var nameOfvalue = component.find("name").get("v.value");
        var outname=component.find("nameout");
        outname.set("v.value",nameOfvalue);
        
	}
})