({
	afterRender: function(component, helper) {
        debugger;
		this.superAfterRender(component, helper);
		helper.createRating(component);
    	}
})