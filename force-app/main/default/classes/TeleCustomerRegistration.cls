global class TeleCustomerRegistration{
    Webservice static string newCustomerRegistration(List<CustomerWrap> lstw){
    String Status='';
    
   List<Account> lsta= new List<Account>();
    for(CustomerWrap objW: lstw){
   Account obja = new Account();
   if (objw.CustomerName!=NULL)
       obja.Name= objw.CustomerName;
   if(objw.CustomerPhone!=NULL)
       obja.Phone= objw.CustomerPhone;
   lsta.add(obja);
   } 
   if(lsta.size()>0){
   try{
   insert lsta;
   Status ='Success';
   }
   Catch(Exception e){
      Status ='Failure';
   }
   }
    
    return status;
    }
    
 Global class CustomerWrap{
 Webservice string CustomerName;
 Webservice string CustomerPhone;
 }
}