public class EmailManager {

//public Method
    Public void SendMail(String[] address, String subject, string body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //string[] toAddresses= new String[] {address};
        mail.setToAddresses(address);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        //Pass this email message to the built-in sendEmail method of the Messaging class.
        Messaging.SendEmailResult[] results=Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
         inspectResults(results);
    }
    
    private static Boolean inspectResults(Messaging.SendEmailResult[] result){
        Boolean sendResult=true;
        for(Messaging.SendEmailResult res:result) {
            if (res.isSuccess()){
                System.debug('Email Sent successfully');
            }
                else {
                    sendResult=false;
                    sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());                
           }
       }
   return sendResult;
    }
  }