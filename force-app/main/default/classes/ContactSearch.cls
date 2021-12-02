public class ContactSearch {

    public static List <Contact> searchForContacts(string lastName, string mailingPostalCode){
        List <Contact> Contact =[SELECT Id, Name, LastName, MailingPostalCode FROM Contact where LastName=:lastName and MailingPostalCode=:mailingPostalCode];
        return Contact;
    }
}