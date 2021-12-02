public with sharing class serversidecontroller {
    @AuraEnabled
    public static string servierside(string fname){
        return ('I am server side controller');
    }
}