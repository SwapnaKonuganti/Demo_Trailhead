public with sharing class WorkOrderRecord {

    /**
   * Create a new candidate Record
   *
   * @param Candidate__c candidate  candidate record to be inserted
   * 
   */
    @AuraEnabled
    public static void createRecord (WorkOrder candidate){
        
        try{
            System.debug('CreateCandidateRecord::createRecord::candidate'+candidate);
            
            if(candidate != null){
                insert candidate;
            }
            
        } catch (Exception ex){
            
        }
        
    }    
}