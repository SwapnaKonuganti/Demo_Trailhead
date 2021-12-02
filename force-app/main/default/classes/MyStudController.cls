public class MyStudController {
    Public Student__c student;
    Public string greeting;
    public MyStudController(){
        
        Id id= ApexPages.currentPage().getParameters().get('id');
            if(Id==null){
                student= new Student__c();
            }
            else{
                student =[select id, Name, Email__c,DOB__c,Class__c from student__c where id=:id];
            }
    
    }
    Public Student__c getstudent(){
    return student;
    }
    
}