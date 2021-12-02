({
	doInit : function(component, event, helper) {
        
		helper.getexpenses(component);
	},
    
    createExpense : function(component, event, helper) {
		var amtField=component.find("amount");
        var amt=amtField.get("v.value");
        if(isNaN(amt)||amt=='')
        {
            amtField.addErrors("v.value",[{message:"Please Enter Amount "}]);
        }else{
            var newExpense=component.get("v.newExpense");
            helper.createExpenses(component,newExpense);
        }
        
	},
})