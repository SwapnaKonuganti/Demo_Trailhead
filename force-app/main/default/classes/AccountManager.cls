@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // Grab the caseId from the wildcard
        String caseId = request.requestURI.substringBetween('Accounts/','/contacts');       
        System.debug('Using caseId = '+caseId);
        // Return results
        Account result= [SELECT Id, Name, (Select Id, Name From Contacts)
                        FROM Account
                        WHERE Id = :caseId];
        return result;
    }
}