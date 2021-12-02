Public class StudentTriggerHelperCls{

    Public Static void UpdateStundentCount(List<Student__c> lsts){
    set<String> SetClassId = new set<String>();
        
        for(Student__c objs:lsts){
            if(objs.Class__c != null){
                SetClassId.add(objs.class__c);
            }
        }
        List<Class__c> cls = [Select Id,name,Number_of_Students__c,(select Id from Stundents__r ) from Class__c where ID IN : SetClassId];
        
        for(Class__c objclass:cls){
            objclass.Number_of_Students__c=objclass.Stundents__r.size();
        }
        update cls;
 
    }
    
    Public Static void UpdateStundentUpdate(map<id, Student__c> newmap,map<id, Student__c> oldmap){
       set<String> SetClassId = new set<String>();
        for(Student__c objs: newmap.values()){
            if(objs.Class__c != oldmap.get(objs.Id).Class__C){
                SetClassId.add(objs.Class__c);
                SetClassId.add(oldmap.get(objs.Id).Class__C);
            }
        }
        HelperMethod(SetClassId);
    }
    
    Public Static void HelperMethod(set<String> SetClassId){
    List<Class__c> cls = [Select Id,name,Number_of_Students__c,(select Id from Stundents__r ) from Class__c where ID IN : SetClassId];
        
        for(Class__c objclass:cls){
            objclass.Number_of_Students__c=objclass.Stundents__r.size();
        }
        update cls;
     
    }
}