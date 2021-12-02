public with sharing class CustomSearchController {
    
    /* Create an Aura Enabled Method which tooks objectName, fieldtoSearch and the text to search */
    /* Develop the Dynamic SOSL and then use Query method of Search Class to return the result */
    @AuraEnabled
    public static String searchRecords(String objName, String fieldName, 
                                     String searchKey){
        String searchKeyword = searchKey + '*';
        String returningQuery = 'Account ( Id, '+fieldName+'),'+ 'Contact(Id, '+fieldName+')';
        System.debug('returningQuery-->'+returningQuery);
        String query = 'FIND :searchKeyword IN ALL FIELDS RETURNING '+returningQuery+' LIMIT 2000';
        System.debug('query-->'+query);
        List<List<sObject>> sobjectList = Search.query(query);
        System.debug('Search.query(query)-->'+Search.query(query));
        return JSON.serialize(sobjectList);
    }
}