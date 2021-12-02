({
	getvalues : function(component, event) {
        var fname=component.find("name").get("v.value");
        var outtxt=component.find("outText");
        outtxt.set("v.value",fname)
		
	}
})