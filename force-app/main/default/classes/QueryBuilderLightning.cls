public class QueryBuilderLightning {
	
    @AuraEnabled
    public static List<String> getObjectName()
    {
        List<String> objects=new List<String>();
       List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();  
        for(SObjectType sot:gd)
        {
           objects.add(sot.getDescribe().getName());
           objects.sort();  
        }
        return objects;
    }
    
    @AuraEnabled
    public static void processObjects(String Objectname)
    {
        String sObjectFields = '';
        set<id> idSet=new set<id>();
        //Getting the fields information
        Map<String, Schema.sObjectField> sObjectFieldMap = Schema.getGlobalDescribe().get(Objectname).getDescribe().fields.getMap();
        
        //Map key is the field API name and value is the field data type.
        Map<String, String> fieldMap = new Map<String, String>();
        
        for(Schema.SObjectField sfield: sObjectFieldMap.Values()){
            Schema.DescribeFieldResult fieldDesc = sfield.getDescribe();
            fieldMap.put(fieldDesc.getName(), fieldDesc.getType().name());
        }
        
        //Create query with all fields
        for(String field: fieldMap.keySet()){
            sObjectFields += field+',';
        }
        sObjectFields = sObjectFields.removeEnd(',');
        system.debug('sObjectFields-->'+sObjectFields);
        //Dynamic SOQL Query with all fields
        String soqlQuery = 'SELECT '+ sObjectFields +' FROM '+Objectname + ' WHERE Id=\'0066F000013v2cY\'';
        List<SObject> listData = Database.query(soqlQuery);
        
        for(SObject recid:listData)
        {
            idSet.add(recid.Id);
        }
        
       if(idSet.size() > 0){
       restApiToUpdateRecords.updateOppty(idSet);
       }   
    }

}