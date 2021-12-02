({    
    doInit: function(component,event,helper){
        var action = component.get('c.getContacts');
        debugger;
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS' && component.isValid()){
                debugger;
                //get contact list
                component.set('v.conList', response.getReturnValue());
                console.log('test --> '+JSON.stringify(component.get('v.conList')));
            }else{
                alert('ERROR...');
            }
        });
        $A.enqueueAction(action);
    }
})