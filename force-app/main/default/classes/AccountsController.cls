public class AccountsController {
    @AuraEnabled
    public static List<Account> getAccounts(){
        return [SELECT Id,name,industry,Type,Number_of_Contacts__c,TickerSymbol,Phone From Account Order by CreatedById ASC];
    }
}