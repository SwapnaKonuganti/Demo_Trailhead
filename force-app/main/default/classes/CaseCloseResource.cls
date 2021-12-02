@RestResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource {
    
    @HttpPost
    global static void closeCase(String reason){
        //Parse Context
        Id id=RestContext.request.requestURI.substringBetween('/case/','/close');
        CaseService.closeCases(new set<Id> {id}, reason);
        
    }

}