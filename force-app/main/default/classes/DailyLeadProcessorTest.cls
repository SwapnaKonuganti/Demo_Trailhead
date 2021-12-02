@isTest
global class DailyLeadProcessorTest {
    global static String CRON_EXP = '0 0 0 * * ?';
    
    static testmethod void testScheduledJob() {
       List<Lead> Leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead lead = new Lead(LastName = 'Test ' + i, LeadSource = '', Company = 'Test Company ' + i, Status = 'Open - Not Contacted');
            leads.add(lead);
	        }
    	    insert Leads;
       
        Test.startTest();
        String jobId = System.schedule('Update LeadSource to DreamForce', CRON_EXP, new DailyLeadProcessor());    
		Test.stopTest();
   
}
}