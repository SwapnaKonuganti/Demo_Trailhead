/*public class DataTableCtrl {
    @AuraEnabled
    public static List<Opportunity> getOpportunities() {
        List<Opportunity> oppsList =
                [SELECT Id, Name, Type, LeadSource FROM Opportunity limit 10];
        return oppsList;
    }
    
    @AuraEnabled
    public static void updateOpportunities (List<Opportunity> oppsList){
        try{
            Database.update(oppsList);
        }catch(Exception e){
            // Do relevant exception handling
        }
    }
}*/
public class dataTableCtrl{
    @AuraEnabled 
    public static List<accountListWrapper> fetchAccountWrapper(){     
        List<accountListWrapper> lstaccountListWrapper = new List<accountListWrapper>();
        // query account records and create 'accountListWrapper' class instance for each record. 
        for(Account acc : [Select id,Name,Type,Phone
                           From Account
                           Limit 1000]){
                               // by default checkbox should be false 
                               lstaccountListWrapper.add(new accountListWrapper(false,acc));
                           } 
        // return the 'lstaccountListWrapper' list 
        return lstaccountListWrapper; 
    }
    
    /* wrapper class */  
    public class accountListWrapper {
        @AuraEnabled public boolean isChecked {get;set;}
        @AuraEnabled public  account objAccount{get;set;}
        public accountListWrapper(boolean isChecked, account objAccount){
            this.isChecked = isChecked;
            this.objAccount = objAccount;
        }
    }
}