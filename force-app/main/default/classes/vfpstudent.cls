public class vfpstudent {
    public List<Student__c> student {get;set;}
    public Student__c stud {get;set;}
    public vfpstudent (){
        student  =[select id,Name,Department__c,City__c from Student__c];
        stud =[select id,Name,Department__c,City__c from Student__c limit 1];
    }
    
}