public with sharing class opportunitiescont {
	@AuraEnabled
    public static List<Opportunity> getopportunity(){
        List<Opportunity> Opportunities=[select id,name from Opportunity LIMIT 15];
        return Opportunities;
    }
}