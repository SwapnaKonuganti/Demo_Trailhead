public with sharing class AjaxCont {
    public String SprintSearchText {get;set;}
    public Integer count {get;set;}
    public List<Sprint__c> lstSprint{get;set;}
    public boolean lstSize{get;set;}
    public List<SelectOption> lstprojects {get;set;}
    public String selectedproj {get;set;}

    public AjaxCont(){
        count=0;
        lstprojects =new List<selectOption>();
        SelectOption sol=new SelectOption ('','-----Select Project-----');
        lstprojects.add(sol);
        for(ProjectI__c project:[Select id,name from ProjectI__c order by name]){
            SelectOption so= new SelectOption(project.Id,project.Name);
            lstprojects.add(so);

        }
    }
    
    public pageReference Incrementcount(){
    count++;
    return null;
    }
    
    public pageReference searchsprint(){
        String query='Select Id, Name, Start_Date__c, Project__c from Sprint__c';
        if(SprintSearchText!=null && SprintSearchText!=''){
            query=query+' where Name Like \'%'+SprintSearchText+'%\'';
        }
        if(selectedproj !=null && selectedproj!=''){
            query=query+' where ProjectI__c=\''+selectedproj+'\''; 
        }
        lstSprint= Database.query(query);
        lstSize=lstSprint.Size()>0?true:false;
        return null;
    }
    
}