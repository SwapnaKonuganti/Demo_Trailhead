public class AccountContactOppProd {
    public List<Account> allAccounts {get;set;}
    public List<Account> displayAccounts {get;set;}
    public Account filterAccount {get;set;}
    public Map<Id, List<Contact>> contactMap {get;set;}
    public Map<Id, List<Opportunity>> opportunityMap {get;set;}
    public AccountContactOppProd () {
        allAccounts = new List<Account>([SELECT Id, Name FROM Account limit 100]);
        filterAccount = new Account();
        displayAccounts = new List<Account>(allAccounts);
        contactMap = new Map<Id, List<Contact>>();
        for(Account a : allAccounts){
            contactMap.put(a.Id, new List<Contact>());
        }
        List<Contact> conc = new List<Contact>
            ([SELECT Id, AccountId, Account.Name, Name FROM Contact
              WHERE AccountId IN:contactMap.keyset() limit 100]);
        for(Contact c : conc){
            contactMap.get(c.AccountId).add(c);
                }
    }
}