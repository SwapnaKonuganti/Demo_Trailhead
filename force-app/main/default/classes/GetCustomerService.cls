@RestResource(urlMapping='/CustomerService1/*')
global with sharing class  GetCustomerService {
    @HttpPost
    global static String getCustomerRecord(String Name,String phone){
            Account objA = new Account();
            objA.Name = Name;
            objA.Phone = phone;
            try{
                Insert objA;
                return 'success';
            }
            catch(Exception e){
                return 'failure';
            } 
    }  
}