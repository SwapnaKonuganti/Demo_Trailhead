public class Acchandler {
    public static boolean isFirstTrigger=true; 
    public void contactAddree(List<Account> account){
        List<Contact> listcnt = new List <Contact>();
              for(Account Accounts: [Select id, BillingStreet,BillingCity,(Select id,MailingStreet,MailingCity from Contacts) from Account where id In :account]){
                for(Contact cont :Accounts.Contacts){
                    cont.MailingStreet=Accounts.BillingStreet;
                    cont.MailingCity = Accounts.BillingCity;
                    listcnt.add(cont);
                }
            }
            update listcnt;
    }

}