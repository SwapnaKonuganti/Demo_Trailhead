public class expensecnt {
    @AuraEnabled
    public static List<Expense__c> getexpenses(){
        return [select id, name,Amount__c,Client__c,Date__c,Reimbursed__c from Expense__c];
    }
    @AuraEnabled
    public static Expense__c savexpense(Expense__c expense){
        upsert expense;
        return expense;
        
    }
}