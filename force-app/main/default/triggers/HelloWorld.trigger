trigger HelloWorld on Account (before insert, before update) {

    List<Account> accs = Trigger.new;
    //MyHelloWorld my=new MyHelloWorld();
    //my.addHelloWorld(accs);
    for(Account a: accs){
        if(a.Hello__c!='World'){
            a.Hello__c='World';
        }
    }

    

}