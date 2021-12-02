Public class MyHelloWorld{
    Public void addHelloWorld(List<Account> acts)
    {
        for(Account a:acts){
            if(a.Hello__c!='World')
            {
            a.Hello__c='World';
            }
            
        }
    
    }
}