Public with sharing class CaseService {
    public static void closeCases(Set<Id> caseIds, String closingReason){
        if(caseIds == null || caseIds.size()== 0){
            throw new CaseServiceException ('You should tell me which cases you wanna close');
         }
         if(caseIds == null || closingReason == ''){
            throw new CaseServiceException ('I won\'t close case without any reason');
         }
        List<Case> CasesToClose=[SELECT Id, Status, Reason from Case where Id IN : caseIds];
        List<Case> Closedcases = new List <Case>();
        
        for(Case CaseToClose : CasesToClose ){
            CaseToClose.Status ='Closed';
            CaseToClose.Reason=closingReason;
            Closedcases.add(CaseToClose);
        }
        SavePoint sp=Database.setSavepoint();
        if (Closedcases.size()>0){
            try{
                update Closedcases;
            }
            Catch(Exception e){
                Database.rollback(sp);
                throw e;
            }
        }
        
    }
    
    public class CaseServiceException extends Exception{}
}