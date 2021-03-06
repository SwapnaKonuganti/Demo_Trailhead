({
    initRecords: function(component, event, helper) {
      // call the apex class method and fetch account list  
         var action = component.get("c.fetchAccount");
             action.setCallback(this, function(response) {
              var state = response.getState();
              if (state === "SUCCESS") {
                  var storeResponse = response.getReturnValue();
                  console.log(JSON.stringify(storeResponse));
               // set AccountList list with return value from server.
                  component.set("v.AccountList", storeResponse);
            }
        });
        $A.enqueueAction(action);
    },
    
    Save: function(component, event, helper) {
      // Check required fields(Name) first in helper method which is return true/false
        if (helper.requiredValidation(component, event)){
              // call the saveAccount apex method for update inline edit fields update 
               var action = component.get("c.saveAccount");
                  action.setParams({
                    'lstAccount': component.get("v.AccountList")
                  });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    var storeResponse = response.getReturnValue();
                    // set AccountList list with return value from server.
                    component.set("v.AccountList", storeResponse);
                    // Hide the save and cancel buttons by setting the 'showSaveCancelBtn' false 
                    component.set("v.showSaveCancelBtn",false);
                    alert('Updated...');
                }
            });
            $A.enqueueAction(action);
        } 
    },
    
    cancel : function(component,event,helper){
       // on cancel refresh the view (This event is handled by the one.app container. It’s supported in Lightning Experience, the Salesforce app, and Lightning communities. ) 
        $A.get('e.force:refreshView').fire(); 
    },
     AddNewRow : function(component, event, helper){
       // call the comman "createObjectData" helper method for add new Object Row to List  
        helper.createObjectData(component, event);     
    },
    
     // function for delete the row 
    removeDeletedRow: function(component, event, helper) {
        debugger;
        // get the selected row Index for delete, from Lightning Event Attribute  
        var index = event.getParam("indexVar");
        // get the all List (contactList attribute) and remove the Object Element Using splice method    
        var AllRowsList = component.get("v.AccountList");
        AllRowsList.splice(index, 1);
        // set the contactList after remove selected row element  
        component.set("v.AccountList", AllRowsList);
    },
})