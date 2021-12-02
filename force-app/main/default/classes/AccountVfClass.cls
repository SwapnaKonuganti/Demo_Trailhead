public with sharing class AccountVfClass {

    Public AccountVfClass (){
    soql='';
    acct=new List<account>();
    }
    Public String Key{get;set;}
    Public string soql;
    Public List<account> acct{get;set;}
    Public void dosearch(){
        soql='';
        soql=soql+'Select id,Name from Account';
        soql=soql+' where Name='+'\''+Key+'\'';
                system.debug('---->'+soql);
        acct=new List<account>();
        acct=Database.query(soql);

    }
}