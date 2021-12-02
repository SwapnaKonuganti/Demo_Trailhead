public with sharing class stucon {
    public Student__c student;
    public stucon(){
     // student= new Student__c();
    Id id= ApexPages.currentPage().getParameters().get('id');
    
    if(Id==null){
    student= new Student__c();
    }
    else
    {
    student =[select id, Name, Email__c,DOB__c,Class__c from student__c where id=:id];
    }
    
    }
    public Student__c getstudent(){
    return student;
    }
    
    public pagereference save(){
    try{
    upsert(student);
    }
    catch(system.DMLException e)
    {
    return null;
    }
    pagereference pg = new ApexPages.Standardcontroller(student).view();
    return pg;
    }
    
}