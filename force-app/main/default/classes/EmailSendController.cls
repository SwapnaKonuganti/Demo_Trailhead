public class EmailSendController {
 @AuraEnabled 
    public static void sendMailMethod(String mMail ,String mSubject ,String mbody){
    
     List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();     
  		String theTemplate = [SELECT Id FROM EmailTemplate WHERE DeveloperName = 'MarketingProductInquiryResponse'].Id;
        User theUser = [SELECT Id FROM User WHERE Name = 'Swapna Integration'];
     // Step 1: Create a new Email
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
    // Step 2: Set list of people who should get the email
       List<String> sendTo = new List<String>();
       sendTo.add(mMail);
       mail.setToAddresses(sendTo);
    	 mail.setTemplateId(theTemplate);
    // Step 3: Set who the email is sent from
       mail.setReplyTo('noreply@gmail.com'); // change it with your mail address.
       mail.setSenderDisplayName('salesforce User'); 
    
    // Step 4. Set email contents - you can use variables!
      mail.setSubject(mSubject);
      mail.setHtmlBody(mbody);
    
    // Step 5. Add your email to the master list
      mails.add(mail);
    
  // Step 6: Send all emails in the master list
     Messaging.sendEmail(mails);
   }   
    
    @AuraEnabled 
    public static void sendMail(){
    
     List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();     
  		String theTemplate = [SELECT Id FROM EmailTemplate WHERE DeveloperName = 'MarketingProductInquiryResponse'].Id;
        User theUser = [SELECT Id FROM User WHERE Name = 'Swapna Integration'];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      	mail.setReplyTo('USCIOProgram@deloitte.com');
        mail.setToAddresses(new String[] { 'TestUser@salesforce.com' ,'abc@test.com'});
        
    	 mail.setTemplateId(theTemplate);
      mail.setSenderDisplayName('salesforce User'); 
      mails.add(mail);
    
     Messaging.sendEmail(mails);
   }   
}