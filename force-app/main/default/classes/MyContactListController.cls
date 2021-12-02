public class MyContactListController {
    @AuraEnabled
    Public static List<Contact> getContacts(){
    	return [Select Id,Name,Email,Title,Phone from Contact];
    }
}