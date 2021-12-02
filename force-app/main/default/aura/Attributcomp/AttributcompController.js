({
	clickadd : function(component) {
        
        var sumvalue= component.get("v.num1") + component.get("v.num2");
        component.set("v.sum",sumvalue);
		
	}
})