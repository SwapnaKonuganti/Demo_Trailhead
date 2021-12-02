({
    requiredValidation : function(component,event) {
        // get all accounts.. 	
        var allRecords = component.get("v.AccountList");
        var isValid = true;
        // play a for loop on all account list and check that account name is not null,   
        for(var i = 0; i < allRecords.length;i++){
            if(allRecords[i].Name == null || allRecords[i].Name.trim() == ''){
                alert('Complete this field : Row No ' + (i+1) + ' Name is null' );
                isValid = false;
            }  
        }
        return isValid;
    },
    createObjectData: function(component, event) {
        // get the contactList from component and add(push) New Object to List  
        var RowItemList = component.get("v.AccountList");
        RowItemList.push({
            'sobjectType': 'Account',
            'Account Name': '',
             'Rating': ''
        });
        // set the updated list to attribute (contactList) again    
        component.set("v.AccountList", RowItemList);
    },
})