({
	getNumber : function(component) {
		var listnumb=[];
        for(var i=0;i<=10;i++){
            listnumb.push({value:i})
        }
        component.set("v.numblist",listnumb);
	}
})