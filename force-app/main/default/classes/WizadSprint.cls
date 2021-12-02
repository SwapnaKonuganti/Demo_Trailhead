public class WizadSprint {
    Private ApexPages.StandardController con;
    Public Sprint__c sprint{get;set;}
    Public List<Sprint__c> lstsprint{get;set;}
    public List<Story__c> lstStories{get;set;}
    public string selsprint{get;set;}
    public Story__c stry{get;set;}
    public ProjectI__c lstprj{get;set;}
    Public WizadSprint(ApexPages.StandardController stdcon){
        con=stdcon;
		sprint = new Sprint__c();
        lstsprint =new List<Sprint__c>();
        stry = new Story__c();
        lstStories = new List<Story__c>();
    }
    
    public pageReference GotoPage2(){
        system.debug(ApexPages.currentPage().getURL().tolowercase().startsWith('/apex/WizardSprint'));
        con.save();
        //lstprj= (ProjectI__c)con.getRecord();
        lstprj= [Select id,name,start_date__c,Budget__c from ProjectI__c where id= :con.getRecord().Id];
        lstsprint = [Select id,name,start_date__c,end_date__c from sprint__c where project__c= :con.getRecord().Id];
        return Page.WizardSprint2;

    }
    
    public pageReference GotoPage3(){
        
        return Page.WizardSprint3;
    }
    public pageReference SaveSprint(){
        system.debug('values' +con.getId());
        sprint.Project__c=con.getId();
        system.debug('complete values' +sprint);
        insert sprint;
        lstsprint.add(sprint);
        //sprint = new Sprint__c();
        return null;
    }
       public PageReference saveStory(){
        stry.Sprint__c=selSprint;
        insert stry;
       // lstStories.add(story);
        lstStories = [select id, name,Description__c,Story_Points__c from Story__c where Sprint__c = :selSprint];
        stry = new Story__c();
        return null;
    }


}