public class restApiToUpdateRecords {
    private string cKey = '3MVG97quAmFZJfVxbSclliypphsrXQ1URPVhNmpFuNoSx5ZjyzRcn1sMLQnPee3cFfPWvSZ1uIpZnIGfSfUEn';
    private string cSecret = 'C7C988287BAF4D1768649CD0B224DC9E7D985D9874AF3956B8BED9BE9EB7A43C';
    private string uName = 'skonuganti9@gmail.com';
    private string PASSWORD='Konuganti@123';
    private string token='QgIcUpwvJxksxgN6txauek4E1';
    private string passwd = 'Konuganti@123QgIcUpwvJxksxgN6txauek4E1';
    public class responseWrapper {
        public string id;
        public string access_token;
        public string instance_url;
    }
    public string getRequestToken() {
        string reqBody = 'grant_type=password&client_id=' + cKey + '&client_secret=' + cSecret + '&username=' + uName + '&password=' + passwd;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqBody);
        req.setMethod('POST');
        req.setEndpoint('https://ap17.salesforce.com/services/oauth2/token');
        HttpResponse hresp = h.send(req);
        responseWrapper wResp = (responseWrapper) JSON.deserialize(hresp.getBody(), responseWrapper.class);
        system.debug('Instance url' + wResp.instance_url);
        system.debug('session id' + wResp.access_token);
        return wResp.access_token;
    }
    @future(callout = true)
    public static void updateOppty(set < id > oppIdSet) {
        system.debug('oppIdSet-->'+oppIdSet);
        for (Opportunity opp: [SELECT id, OrderNumber__c from opportunity where id in: oppIdSet]) {
            wrapperParameter resWrap=new wrapperParameter();
            resWrap.opptyExternalId=opp.OrderNumber__c;
            String accToken;
            string responseBody;
            string endPoint = 'https://ap17.salesforce.com/services/apexrest/updateopportunityrecord/';
            restApiToUpdateRecords obj = new restApiToUpdateRecords();
            accToken = obj.getRequestToken();
            system.debug('access token' + accToken);
            if (accToken != '') {
                Http h1 = new Http();
                HttpRequest req1 = new HttpRequest();
                req1.setHeader('Authorization', 'Bearer ' + accToken);
                req1.setHeader('Content-Type', 'application/json');
                system.debug('Json-->'+JSON.serialize(opp));
                req1.setBody(JSON.serialize(opp));
                //req1.setBody(JSON.serialize(resWrap));
                req1.setMethod('PUT');
                req1.setEndpoint(endPoint);
                HttpResponse hresp1 = h1.send(req1);
                //listWrap=(list<resultWrapper>) JSON.deserialize(hresp1.getBody(),list<resultWrapper>.class);
            }
        }
    }
    @future(callout = true)
    public static void updatesObjects(String Product2Id, String productName) {
        String query='SELECT Id, Name,Product__c FROM Animal__C WHERE Product__c='+'\''+Product2Id+'\'';
        system.debug('query-->'+query);
        //List<Animal__C> animals = Database.query(query);
        List<SObject> listData = Database.query(query);
        wrapperParameter resWrap=new wrapperParameter();
        resWrap.opptyExternalId=productName;
        resWrap.allObjects=listData;
        String accToken;
        string responseBody;
        string endPoint = 'https://ap17.salesforce.com/services/apexrest/updateopportunityrecord/';
        restApiToUpdateRecords obj = new restApiToUpdateRecords();
        accToken = obj.getRequestToken();
        system.debug('access token' + accToken);
        if (accToken != '') 
        {
        	Http h1 = new Http();
            HttpRequest req1 = new HttpRequest();
            req1.setHeader('Authorization', 'Bearer ' + accToken);
            req1.setHeader('Content-Type', 'application/json');
            system.debug('Json-->'+JSON.serialize(listData));
            //req1.setBody(JSON.serialize(listData));
            req1.setBody(JSON.serialize(resWrap));
            req1.setMethod('PUT');
            req1.setEndpoint(endPoint);
            HttpResponse hresp1 = h1.send(req1);
                //listWrap=(list<resultWrapper>) JSON.deserialize(hresp1.getBody(),list<resultWrapper>.class);
            }
        //}
    }
     public class wrapperParameter{
       public string opptyExternalId;
       public List<Sobject> allObjects;   
      }
}