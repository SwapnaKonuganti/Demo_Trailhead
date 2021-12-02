({
createRating : function(component) {
        	// check in case coming from afterRender,
        	// before scripts are loaded
        	var ready = component.get("v.ready");
        	if (ready === false) {
        	    return;   
		}

		var ratingElem = component.find("rating").getElement();
        
		$(ratingElem).raty({
            		starType: "i",            
            		score: component.get("v.value"),
            		click: function(score, evt) {
                		component.set("v.value", score);
            		}
        	});
	}
})