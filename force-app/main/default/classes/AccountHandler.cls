public class AccountHandler {
    Public static Account insertNewAccount(String name){
        Account acct=new Account(Name=name);
   		acct.Name=name;  
        try
        {
          insert acct;
        } catch (Exception e){
          return null;
        }
        return acct;
    }
       
  }