public class AccountController {
     @AuraEnabled
    public static Account getAccount() {
        return [select Id, Name from Account Limit 1];
    }
}