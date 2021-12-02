@RESTRESOURCE(urlMapping='/CustomerRegistration/*')
global class CustomerRegistration{
    @HttpPost
    Global static String InsertCustomer(String Name, String Phone){
    Account objA=new Account();
    objA.Name=name;
    objA.Phone=Phone;
    
    String Status ='';
    
    try{
    insert objA;
    if (objA!=Null){
    Status='Success';
    }
    }
    Catch(Exception e){
    Status ='Failure';
    }
    return Status;
    }

}