trigger StudentUpdate on Student__c (after insert,after Update) {
    if (trigger.isInsert && trigger.isAfter){
    
    StudentTriggerHelperCls.UpdateStundentCount(trigger.new);
    CityLocationUpdate.UpdateLocation(trigger.new);
}

if (trigger.isUpdate && trigger.isAfter){
    
    StudentTriggerHelperCls.UpdateStundentUpdate(trigger.newmap, trigger.oldmap);
}
}