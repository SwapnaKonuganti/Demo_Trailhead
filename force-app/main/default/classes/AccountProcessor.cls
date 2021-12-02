public class AccountProcessor {
@Future
    Public Static void countContacts(Set<id> setid){
        List<Account> accounts = [Select Id, Number_of_Contacts__c, (Select id from Contacts) from Account Where Id IN :setId];
        List<Account> accs = new List<Account>();
        for(Account acc:accounts){
            List<Contact> lstcontact = acc.contacts;
            acc.Number_of_Contacts__c=lstcontact.size();
            accs.add(acc);
        }
        update accs;
        
    }
}