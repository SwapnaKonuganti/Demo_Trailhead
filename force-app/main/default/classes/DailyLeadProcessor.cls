global class DailyLeadProcessor implements Schedulable {
    global 	void execute(SchedulableContext ctx){
        List<lead> IsList= [SELECT LeadSource FROM Lead where LeadSource =null];
        if(!IsList.isEmpty()){
            for(Lead l:IsList){
                    l.LeadSource='Dreamforce';
                    update IsList;
            }
        }
        
    }

}