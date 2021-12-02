({
	getexpenses : function(component) {
		var action = component.get("c.getexpenses");
        var sef= this;
        action.setCallback(this,function(response){
            var state = response.getState();
            
            if(state==="SUCCESS"){
                component.set("v.expenses", response.getReturnValues());
                self.updateTotal(component);}
            
        });
        $A.enquequeAction(action);
     	},
    updateTotal : function(component) {
		var expenses = component.get("v.Expenses");
        var total=0;
        for(var i=0 ; i< Expenses.length; i++){
            var e=expenses[i];
            total+=e.Amount__c;
        }
        component.set("v.total");
        component.set("v.exp",Expenses.length);
     	},
    createExpense : function(component,Expense) {
        this.upsertExpense(component,expense,function(a){
            var Expenses = component.get("v.Expenses");
            Expenses.push(a.getReturnValue());
            component.set("v.Expenses",Expenses)
            this.updateTotal(component);
        });
     	},
    upsertExpense : function(component,Expense,callback) {
        var action=component.get("c.savexpenses");
        action.setParams({"expense":expense});
        if(callback){action.setCallback(this,callback)}
        $A.enquequeAction(action);
     	}
})