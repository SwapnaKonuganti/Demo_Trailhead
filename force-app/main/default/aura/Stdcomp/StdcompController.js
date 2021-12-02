({
	getnumbers : function(component) {
		var listOfNumbers=[];
        for(var i=0;i<=10;i++){
            listOfNumbers.push({value:i})
        }
        component.set("v.number",listOfNumbers);
	}
})