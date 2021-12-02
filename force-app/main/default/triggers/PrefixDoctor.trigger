trigger PrefixDoctor on Lead ( before insert,before update) {
    
    List<Lead> ld = Trigger.New;
    for(Lead l :ld){
    l.firstname ='Dr.'+l.firstname;
    }

}