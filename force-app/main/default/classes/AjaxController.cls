public class AjaxController {
    public String sprintSearchText{get;set;}
    public List<Sprint__C> lstSprints{get;set;}
    public boolean listSize{get;set;}
    public List<SelectOption> lstprojects{get;set;}
    public String selectedproj{get;set;}
     public Integer count { get; set; }
    public AjaxController (){
        listSize=false;
         count=0;
       // lstSprints= new List<Sprint__C>();
        lstprojects= new List<SelectOption>();
        SelectOption so1= new SelectOption('','-----Select Project-----');
        lstprojects.add(so1);
        for(ProjectI__c project:[Select id,name from projectI__C order by name]){
            SelectOption so= new SelectOption(project.Id,project.Name);
            lstprojects.add(so);
        }
    }
    
     public PageReference incrementCount(){
        count++;
        return null;
    }
    public PageReference searchSprint(){
        String query  = 'Select id,Name,start_date__c, project__C,project__r.Name from Sprint__c';
        if(SprintSearchText!=null && sprintSearchText!=''){
            query = query + ' where Name LIKE \'%'+sprintSearchText+'%\' ';
        }
        if(selectedproj !=null && selectedproj!='' ){
            query = query+ ' where project__c =\''+selectedproj+'\'';
        }
        system.debug(query);
        lstSprints = Database.query(query);
        listSize=lstSprints.size()>0?true:false;
        return null;
    }
    
}