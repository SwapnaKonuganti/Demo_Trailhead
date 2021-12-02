trigger opportunityMainTrigger on Opportunity (after update) {
    set<id> oppIdSet=new set<id>();
    for(opportunity opp:trigger.new){
        if(opp.StageName=='Closed Won'){
            oppIdSet.add(opp.id);
        }
     }
    if(oppIdSet.size() > 0){
        restApiToUpdateRecords.updateOppty(oppIdSet);
       }   
   }