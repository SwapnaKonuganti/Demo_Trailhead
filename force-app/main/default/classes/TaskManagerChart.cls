public class TaskManagerChart {
    
    @AuraEnabled
    public static List<DataSet> getAllTasksByStatus(){
        //List<AggregateResult> result =  [Select Count(Id) cnt, Status__c from Task__c group by Status__c ];
        List<DataSet> dataSet = new List<DataSet>();
			dataSet.add(new DataSet('inactive' ,5));
            dataSet.add(new DataSet('Active' ,5));
			dataSet.add(new DataSet('YettoStart' ,5));
        System.debug('dataSet'+dataSet);
        return dataSet ; 
    }
    
    public class DataSet{
        public DataSet(String label ,Integer count){
            this.label  = label ; 
            this.count = count ;
        }
        @AuraEnabled
        public String label {get;set;}
        @AuraEnabled
        public Integer  count {get;set;}
        
        
    }
    
}