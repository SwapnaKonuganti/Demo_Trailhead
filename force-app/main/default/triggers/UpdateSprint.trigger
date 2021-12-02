trigger UpdateSprint on ProjectI__c (after insert,before insert) {
    List<Sprint__c> sp = new List<Sprint__c>();
    if(trigger.isAfter){
        if(trigger.isInsert){
            for(ProjectI__c Pro : Trigger.new){
                Sprint__c sprint = new Sprint__c();
                sprint.Start_Date__c =Pro.Start_Date__c;
                sprint.Project__c =pro.Id;
                sp.add(sprint);
            }
            insert sp;
        }
    }
    Map<string, ProjectI__c> MapProj = new Map<string, ProjectI__c>();
    if(trigger.isBefore){
        if(trigger.isInsert){
            for(ProjectI__c pr : Trigger.new){
                if(MapProj.containsKey(pr.Name)){
                    pr.addError('You are trying to insert new projects with same name');
                }
                else{
                    MapProj.put(pr.Name, pr);
                }
                for(ProjectI__c exisitingPro : [select id, name from ProjectI__c where name IN :MapProj.keySet()]){
                    MapProj.get(exisitingPro.Name).addError('A project exists with the same name. Please change the name.');
                }
            }
        }
    }

}