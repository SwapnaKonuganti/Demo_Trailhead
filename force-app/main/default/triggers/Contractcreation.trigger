trigger Contractcreation on Account (after insert) {

    List<Contact> listContacts = new List<Contact>();
    map<id,decimal> mapAcc = new map<id,decimal>();
    
    for(Account acc: Trigger.new){
        mapAcc.put(acc.id,acc.NumberofLocations__c);
    }
    
    if (mapAcc.size()>0 && mapAcc!=NULL){
        for(Id accId:mapAcc.Keyset()){
            for(integer i=0; i< mapAcc.get(accId);i++){
            contact c=new contact();
            c.accountId=accId;
            c.lastname='contact'+i;
            listContacts.add(c);
            }
        
        }
        
    }
    if(listContacts.size()>0 && listContacts!=Null){
    insert listContacts;
    }
}