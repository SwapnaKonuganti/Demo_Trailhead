public class product2controller {

    @AuraEnabled
    public static Map<Id,String> getProductList()
    {
       Map<Id,String> options = new Map<Id,String>();
       List<Product2> products=[SELECT Id,Name FROM Product2];
       for(product2 prdcts:products)
        {
           options.put(prdcts.Id,prdcts.Name);  
        }
        return options;
    }
    
   @AuraEnabled
    public static Map<Id,String> getAllProducts(string searchTerm)
    { 
        Map<Id,String> options = new Map<Id,String>();
        searchTerm='\'%' + String.escapeSingleQuotes(searchTerm.trim()) + '%\'';

        system.debug('searchTerm-->'+searchTerm);
        String query = 'SELECT Id,Name FROM Product2 WHERE Name Like '+searchTerm;
        system.debug('query-->'+query);
        List<Product2> products = Database.query(query);
       //List<Product2> products=[SELECT Id,Name FROM Product2 where Name Like +'\'%' + searchTerm + '%\''+];
       for(product2 prdcts:products)
        {
           options.put(prdcts.Id,prdcts.Name);  
        }
        return options;
    }
   
}