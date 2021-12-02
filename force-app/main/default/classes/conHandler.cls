public class conHandler {
    public void AccUpdate(List<Contact> cont){
      List<Account> lstAccount = new List<Account>();
      for(contact con:cont){
           if(con.AccountId!=null){
      	      Account account=new Account(Id=con.AccountId,Name=con.Name);
           	  lstAccount.add(account);
           }
       }
       update lstAccount;
    }

}