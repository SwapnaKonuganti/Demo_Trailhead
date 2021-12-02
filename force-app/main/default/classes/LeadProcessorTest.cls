@isTest
public class LeadProcessorTest {
    static TestMethod void TestMethod1(){
        List<Lead> lstlead=new List<Lead>();
        for(integer i=0; i<200; i++){
            Lead led = new Lead();
            led.FirstName='FirstName';
            led.LastName='LastName';
            led.Company='demo'+i;
            lstlead.add(led);
        }
        insert lstlead;
        Test.startTest();
        LeadProcessor obj=new LeadProcessor();
        Database.executeBatch(obj);
        Test.stopTest();
            
        
    }

}