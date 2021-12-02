trigger duplicateAccountTrigger on Account (before insert, before update) {
    set<String> accountName = new set<String>();  // TATA, CAR
    set<String> groupAccount = new set<String>();
    //Looping through Account
    for(Account a: Trigger.New)
    {
        system.debug('a.Name==>'+a.Name);
        accountName.add(a.Name);
    }
    //check Account Name exists in PG  or not 
    List<Group> accountPG = [select id,relatedid,name from Group where name IN:accountName]; //TATA
    
    
    if(accountPG!=null)
    {
        for(Group gp:accountPG)
        {
            groupAccount.add(gp.name);
        }
        
        for(String accName:accountName)
        {
            if(groupAccount.contains(accName))
            {
                //error message
                //accName.addError('Duplicate Error');
            }
            else 
            {
                //Create a Group for First Time
        		createPG(accountName);
            }
        }
    }
    else{
        //Create a Group for First Time
        createPG(accountName);
    }
    
    Public static void createPG(set<String> accountName)
    {
        Group checkAccountName= new Group();
        for(string aname:accountName)
        {
            checkAccountName.Name=aname; 
        }
        if(checkAccountName!=null)
        {
            insert checkAccountName; //DML
        }
    }
    
}