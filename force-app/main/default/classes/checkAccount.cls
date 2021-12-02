@RestResource(urlMapping='/showAccounts/*')
global class checkAccount
{

@HttpGet
global static List<Account> getAccount()
{
List<Account> acclst;
try{
acclst=[SELECT Id,Name,Phone FROM Account Limit 20];
return acclst;
}
catch(Exception ex)
{
system.debug('error-->'+ex.getMessage());
}
return acclst;
}
}