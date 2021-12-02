@RestResource(urlMapping='/RestDemo/*')
global class RestDemo{
    @HTTPGET
    global static List<Account> returnCustomer(){
        return [Select id, name,Phone from Account limit 10];
    }
}