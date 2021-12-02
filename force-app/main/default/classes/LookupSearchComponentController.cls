public class LookupSearchComponentController {
    
    @AuraEnabled
    public static List<SObJectResult> getResults(String value) {
        List<SObJectResult> sObjectResultList = new List<SObJectResult>();
        for(sObject so : Database.Query('Select Id,Name FROM Product2 WHERE Name LIKE \'%' + value + '%\'')) {
            String fieldName='Name';
            String fieldvalue = (String)so.get(fieldName);
            sObjectResultList.add(new SObjectResult(fieldvalue, so.Id));
        }
        
        return sObjectResultList;
    }
    
    public class SObJectResult {
        @AuraEnabled
        public String recName;
        @AuraEnabled
        public Id recId;
        
        public SObJectResult(String recNameTemp, Id recIdTemp) {
            recName = recNameTemp;
            recId = recIdTemp;
        }
    }
    
    @AuraEnabled
    public static List<SObJectResult> getobjectslist(String Product2Id) {
        List<SObJectResult> sObjectResultList = new List<SObJectResult>();
        String prquery='SELECT Id, Name FROM Product2 WHERE Id='+'\''+Product2Id+'\'';
        List<Product2> prduct = Database.query(prquery);
        String query='SELECT Id, Name FROM Animal__C WHERE Product__c='+'\''+Product2Id+'\'';
        system.debug('query-->'+query);
        List<Animal__C> animals = Database.query(query);
        List<SObject> listData = Database.query(query);
        system.debug('Database soqlquery-->'+listData);
        restApiToUpdateRecords.updatesObjects(Product2Id,prduct[0].Name);
        return null;
    }
}