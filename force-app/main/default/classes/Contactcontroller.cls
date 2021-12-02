public with sharing class Contactcontroller {

    @AuraEnabled
    public static List<Contact> findAll(){
        return [select id,Name,phone from Contact LIMIT 50];
    }
    
    @AuraEnabled
    public static List<Contact> findsearch(string searchKey){
        string name='%'+searchKey+'%';
        return [select id,Name,phone from Contact where Name LIKE:name LIMIT 50];
    }
    
    @AuraEnabled
    public static Contact findById(String contactId) {
        return [SELECT id, name, title, phone, mobilephone, Account.Name
                    FROM Contact WHERE Id = :contactId];
    }
}