public class customlistcon {
    //ApexPages.StandardSetController must be defined for list controllere 
    public ApexPages.StandardSetController cont {
    get{
    if(cont== null)
    {
        cont=new ApexPages.StandardSetcontroller([select id,Name,DOB__c,Email__c from Student__c]);
    }
    return cont;
    }
    set{
    }
    }
    
    //Initializing stu and returning list of records
      public List<Student__c> getstu() {
      return (List<Student__c>) cont.getRecords();
      }
  }