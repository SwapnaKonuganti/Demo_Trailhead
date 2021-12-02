@isTest
public class CaseServiceTest {

    @isTest
    public static void testCloseCasesShouldCloseCasesWithTheSpecifiedReason(){
        setupTest();
        Set<id> insertedCaseId= new Set<id>();
        for (Case c:[Select Id from Case]){
            insertedCaseId.add(c.Id);
        }
        System.assertEquals(100, insertedCaseId.Size());
        CaseService.closeCases(insertedCaseId, 'This is my test reason');
        System.assertEquals(100, [SELECT Id From Case where Status='Closed' AND Reason='This is my test reason'].size());
        
    }
    
    @isTest
    Public static void testCloseCasesShouldThrowACaseServiceExceptionWithoutCasesToClose(){
        try{
             CaseService.closeCases(new Set<Id>(),'');
            system.assert(false);
        }
        Catch( CaseService.CaseServiceException e){
          System.assertEquals('You should tell me which cases you wanna close', e.getMessage());
  
        }
    }
    
    @isTest
    Public static void testCloseCasesShouldThrowACaseServiceExceptionWithoutReason(){
         setupTest();
        Set<id> insertedCaseId= new Set<id>();
        for (Case c:[Select Id from Case]){
            insertedCaseId.add(c.Id);
        }
        System.assertEquals(100, insertedCaseId.Size());
        
        try{
            CaseService.closeCases(insertedCaseId,'');
            system.assert(false);
        }
        Catch(CaseService.CaseServiceException e){
          System.assertEquals('I won\'t close a case without any reason', e.getMessage());
            
        }
    }
    private static void setupTest(){
        List<Case> testcases = new List<Case>();
        for(Integer i=0; i<100;i++){
            testCases.add(new case (Subject='Test case number'+1,Status='New'));
        }
        insert testcases;
    }
}