({
    doInit: function (component, event, helper) {
        debugger;
        component.set('v.oppCols', [
            { label: 'Opportunity Name', fieldName: 'Name', type: 'text', editable: true},
            { label: 'Type', fieldName: 'Type', type: 'text', editable: true},
            { label: 'Lead Source', fieldName: 'LeadSource', type: 'text', editable: true}
        ]);
        helper.getOpportunitiesData(component);
    },
    
    /*handleSaveOpps: function (component, event, helper) {
        var draftValues = event.getParam('draftValues');
        var action = component.get('c.updateOpportunities');
        action.setParams({ 
            "oppsList": draftValues
        });
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                helper.fireSuccessToast(component);  
                helper.fireRefreshEvt(component);
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
                helper.fireFailureToast(component);  
            }
        }));
        $A.enqueueAction(action);
    } */
})