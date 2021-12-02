({
	doExpenses : function(component, event, helper) {
		helper.getexpenses(component);
	},
    
    createExpense : function(component, event, helper) {
		var amtFied=component.find("amount");
        vatr amt=amtFied.get("v.value");
        if(isNaN(amt)||amt=''){
            amtField.addErrors("v.value",[{message:"Please Enter Amount "}]);
        }else{
            var newExpense=component.get("v.newExpense");
            helper.createExpense(component,newExpense);
        }
        
        helper.getexpenses(component);
	}
})