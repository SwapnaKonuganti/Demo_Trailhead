public class custsetting {
    public boolean Enable{get;set;}
    List<samplelist__c> SamList = new List<samplelist__c> ();
    List<RTrakAccess__c> RTraklist = new List<RTrakAccess__c>();
    public custsetting(){
        updatesetting();
        Id profileId = UserInfo.getProfileId();
        String profileName = [Select Name from Profile where Id =:profileId].name;
        //Map<String,samplelist__c> sample=samplelist__c.getAll();

    }
   public void updatesetting(){
       //DPS Integration custom setting updates
    samplelist__c slist= samplelist__c.getInstance('DPS Staging');
       if(slist.URL__c==null){
       slist.URL__c='https://uswasgws.deloitte.com/sap/opu/odata/sap/ZEM_CLIENT_DATA_SALESFORCE_SRV/client_dataSet?$filter=';
       slist.NightURL__c='https://uswasgws.deloitte.com/sap/opu/odata/sap/ZEM_NIGHTLY_SYNC_SF_SRV/customerSet?$filter=';
       update slist;
       }
      
       //RTrackAccess custom setting updates
     RTrakAccess__c RTrakAccess= RTrakAccess__c.getInstance('RtrakStaging');
       system.debug('==>'+RTrakAccess);
       if(RTrakAccess.Token__c==null){
       RTrakAccess.Token__c='dXNcdXNTUnRyYWtBUElzdmM6bXVWVThyZWM=';
       RTrakAccess.URL__c='https://srtrak.deloittenet.com/api/';
       RTrakAccess.App_Auth_ID__c='21676A1F-4F99-40FF-B672-3BF1D0907B6D';
		update RTrakAccess; 
        system.debug('==>'+RTrakAccess.URL__c);
       }
       //Batch Process custom setting update 
     BatchProcessDates__c BPDates = BatchProcessDates__c.getOrgDefaults();
       BPDates.userAlias__c='usSRtrakAPIsvc';
      update BPDates;
       
       /*/update email for our team users
       String[] addr = new String[]{'abc@gmail.com', 'xyz@gmail.com'};
       String Subject='Deploy to Staging';
       String body ='Please make sure that all of your tested Stories/Tickets are committed to repository and displayed in the report to be picked up for deployment.';
       EmailManager Email =new EmailManager();
       Email.SendMail(addr,Subject,body);*/
       
    }
  

}