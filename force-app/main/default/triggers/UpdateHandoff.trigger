trigger UpdateHandoff on Top_X_Designation__c(after insert, after update, after delete){
    List<Opportunity> listOppUpdate= new List<Opportunity>();
    List<Opportunity> listOpp = new List<Opportunity>();
    
    Set<Id> SetOppId= new Set<Id>();
    Set<Id> SetOppDelete= new Set<Id>();
    
    map<id,id> mapDocAttachTrue= new map<id,id>();
    map<id,id> mapDocAttachFalse= new map<id,id>();
    map<id,id> mapDelete= new map<id,id>();
    
    if(Trigger.isInsert || Trigger.isUpdate){
        for (Top_X_Designation__c ada:Trigger.new){
            if(ada.Document_Attached__c== True && ada.Type__c=='Contract Flow Down/Handoff'){
                mapDocAttachTrue.put(ada.Opportunity__c,ada.id);
                SetOppId.add(ada.Opportunity__c);
            }
            else 
            mapDocAttachFalse.put(ada.Opportunity__c,ada.id);
            SetOppId.add(ada.Opportunity__c);        
        }
    }
    if(Trigger.isDelete){
        for (Top_X_Designation__c ada:Trigger.old){
        mapDelete.put(ada.Opportunity__c,ada.id);
        SetOppId.add(ada.Opportunity__c);        
        SetOppDelete.add(ada.Opportunity__c);        
        }
        
    }
    listOpp= [Select id, Handoff_Attached__c from Opportunity where id in : SetOppId];
    
    if (listOpp.size()>0 && listOpp !=NULL){
        for(Opportunity Opp:listOpp){
            if(mapDocAttachTrue.containskey(opp.id)){
                Opp.Handoff_Attached__c ='Yes';
            }
            if(mapDocAttachFalse.containskey(opp.id)){
                Opp.Handoff_Attached__c ='No';
            }
            if(mapDelete.containskey(opp.id)){
                Opp.Handoff_Attached__c ='';
            }
            listOppUpdate.add(Opp);
        }
    }
    
    if(listOppUpdate.size()>0 && listOppUpdate!=NULL){
    update listOppUpdate;
    System.debug('list of updates'+listOppUpdate);
    }
    }