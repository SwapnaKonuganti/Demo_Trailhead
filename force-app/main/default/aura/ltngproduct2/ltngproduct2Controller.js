({
	doinit : function(component, event, helper) {
        var action = component.get("c.getProductList");
            action.setCallback(this, function(response) {
        var state = response.getState();
        var optionsList = [];
        if (state === "SUCCESS") {           
            var response = response.getReturnValue();
            for (var key in response) 
            {
                if (response.hasOwnProperty(key)) 
                {
                    optionsList.push({value: key, label: response[key]});
                }
            };
            //component.set('v.optionsList', optionsList);
            component.set("v.options", optionsList);
            console.log('options-->'+component.get("v.options"));
        }                    
        else if (state === "ERROR") {
            var errors = response.getError();
            if (errors) {
                if (errors[0] && errors[0].message) {
                    console.log("Error message: "+errors[0].message);
                }
            } 
            else {
                console.log("Unknown Error");
            }
        }
    });
    $A.enqueueAction(action);
		
	},
    
    onChangeSearchText: function (component, event, helper) {
        helper.onChangeSearchTextHelper(component, event);
    },
})