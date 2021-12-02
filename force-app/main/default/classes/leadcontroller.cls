public with sharing class leadcontroller {
    @AuraEnabled(cacheable=true)
    public static List<Lead> getLeadList() {
        return [SELECT Id,Model__c,Source__c,Status__c,Prospect__C,Modeltype__c,Type__c,Prospect__r.Name,Assigned_To_Dealership__c,Outcome__c,Consultant__r.Name FROM Lead WHERE Prospect__c!= null LIMIT 10];
    }
    @AuraEnabled(cacheable=true)
    public static String getcontactId(String leadId) {
        System.debug('leadId-->'+leadId);
        List<Lead> leads= [SELECT Id,Model__c,Source__c,Status__c,Prospect__C,Modeltype__c,Type__c FROM Lead WHERE Id=:leadId];
        return leads[0].Prospect__C;
    }
}