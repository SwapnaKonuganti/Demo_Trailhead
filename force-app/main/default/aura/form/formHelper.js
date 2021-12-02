({
	getexpenses : function(component) {
		var action = component.get("c.getexpenses");
        var self= this;
        action.setCallback(this,function(response){
            var state = response.getState();
            
            if(state==="SUCCESS"){
                component.set("v.expenses", response.getReturnValues());
                self.updateTotal(component);}
            
        });
        $A.enquequeAction(action);
     	},
    updateTotal : function(component) {
		var expenses = component.get("v.expenses");
        var total=0;
        for(var i=0 ; i< expenses.length; i++){
            var e=expenses[i];
            total+=e.Amount__c;
        }
        component.set("v.total");
        component.set("v.exp",expenses.length);
     	},
    createExpenses : function(component,expense) {
        this.upsertExpense(component,expense,function(a){
            var expenses = component.get("v.expenses");
            Expenses.push(a.getReturnValue());
            component.set("v.expenses",expenses)
            this.updateTotal(component);
        });
     	},
    upsertExpense : function(component,expense,callback) {
        debugger;
        var action=component.get("c.savexpense");
        action.setParams({"expense":expense});
        if(callback)
        {
            action.setCallback(this,callback);
        }
        $A.enquequeAction(action);
     	}
})