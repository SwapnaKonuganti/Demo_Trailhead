({
    handledeletedFields : function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire();
        var currentURL = window.location.href;
        const objectLMidURL = component.get("v.objectLMidURL");
        const objectEndURL = component.get("v.objectEndURL");

        if(!currentURL.includes(objectLMidURL) || !currentURL.includes(objectEndURL)) {
            alert(component.get("v.alertMessage"));
            return;
        }
		//Calculate Starting Index and end Index then identify the current sObject Id
        var startIndex = currentURL.indexOf(objectLMidURL) + objectLMidURL.length;
        var endIndex = currentURL.indexOf('/',startIndex);
        var currentsObjectId = currentURL.substring(startIndex,endIndex);
        
        var url = component.get("v.deletedFieldsURL") + currentsObjectId;
        window.open(url, 'Deleted Fields', 'width='+component.get("v.modalWidth")+', height='+component.get("v.modalHeight"));
    }
})