public class ContactAndLeadSearch {

    Public Static List<List<sObject>> searchContactsAndLeads(String keyword){
        list<list<sObject>> sobjects = [find :keyword IN ALL FIELDS Returning lead(FirstName, LastName), contact(firstname, lastname)];
        return sobjects;

        
    }
}