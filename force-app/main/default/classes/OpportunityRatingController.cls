public class OpportunityRatingController{
    
    // Used to get Opportunity's current rating.
    // Params: recordId - Opportunity record id.
    @AuraEnabled
    public static Integer getOpportunityCurrentRating( Id recordId ){
        Opportunity oppRecord = [SELECT Id, Rating_c__c from Opportunity WHERE Id=:recordId];
        return oppRecord.Rating_c__c != null ? Integer.valueOf( oppRecord.Rating_c__c ): 0;
    }

    // Used to update Opportunity record with new rating.
    // Params: { recordId: Opportunity record id, rating: new rating for this opportunity }
    @AuraEnabled
    public static String updateOpportunityRating(Id recordId, Decimal rating ){
        update new Opportunity( id=recordId, Rating_c__c= rating);
        return 'SUCCESS';
    }
}