global with sharing class NominationEmail {

    public String getGetRoleId() {
   List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        
        String theTemplate = [SELECT Id FROM EmailTemplate WHERE DeveloperName = 'MarketingProductInquiryResponse'].Id;
        User theUser = [SELECT Id FROM User WHERE Name = 'Swapna Integration'];

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        mail.setSaveAsActivity(false);
        mail.setTemplateId(theTemplate);
       // mail.setWhatId(poId);
        mail.setTargetObjectId(theUser.Id);
        mail.setToAddresses(new String[] { 'TestUser@salesforce.com' ,'abc@test.com'});  //add other emails here.
        emails.add(mail);
        
        Messaging.sendEmail(emails);
        return null;
    }

 @AuraEnabled
public static List<String> getRoleId(String RoleId){
    //List<String> ImgUrlsList=new List<String>();
        //ImgUrlsList.add('/email/author/emailauthor.jsp?retURL=/'+Rolel.Id+'&p26=USCIOProgram@deloitte.com&p24='+Rolel.LCSP_Email__c+','+Rolel.LCP_Email__c+','+Rolel.AERS_Lead_Partner_Email__c+','+Rolel.CAM_Email__c+','+Rolel.CRE_Email__c+','+Rolel.CIO_Fellow_1_Email__c+','+Rolel.CIO_Fellow_2_Email__c+','+Rolel.Nomination_POC_Email__c+','+Rolel.Additional_POC_Email__c+','+Rolel.Prior_Session_Host_Email__c+'&p4=USCIOProgram@deloitte.com&p3_lkid='+Rolel.Id+'&template_id=00Xd00000027Fbe&new_template=true&p5=');
                List<string> emailList = new List<string>();
         
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
           // mail.setTargetObjectId();
            
            //mail.setToAddresses(emailList);
            EmailTemplate ET = new EmailTemplate();
            ET=[select id,name from EmailTemplate Where name='  Marketing: Product Inquiry Response' limit 1];
            mail.setTemplateId(ET.id);
             Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    
    return null;
   }
}