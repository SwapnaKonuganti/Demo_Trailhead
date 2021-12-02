@isTest(SeeAllData=true)
public class OrderHandlerTest {

    static void setupData(){

    }
    
    static testMethod void testorderHandler(){
         map<id,order> neworderList = new map<id,order>();  
   		 map<id,order> oldOrderList = new map<id,order>();
        List<Quote> quoteList = new List<Quote>();
        map<id,list<orderItem>> ordItemMap= new map<id,list<orderItem>>();
        List<QuoteLineItem> listval = new List<QuoteLineItem>();
        Account acct = new Account(Name='tAccount');
		insert acct;

        Contract ct = new Contract();
        ct.AccountId = acct.Id;
        ct.Status = 'Draft';
        ct.StartDate = Date.Today();
        ct.ContractTerm = 12;
        insert ct;

        ct.Status = 'Activated';
        update ct;
        Opportunity opp = new Opportunity(Name = 'Test Syndicated 2010', Type = 'Syndicated - New', StageName = 'Planning', CloseDate = system.today());
        insert opp;
        String standardPriceBookId =Test.getStandardPricebookId();
        Quote quttest = new Quote (Name = 'qoutetest' , OpportunityId = opp.id , Pricebook2Id = standardPriceBookId );
        insert quttest;
        
        Product2 pd = new Product2(Name='Pord A',isActive=true);
        pd.IsActive = true;
        insert pd;
        
        PricebookEntry pbe = new PricebookEntry(Pricebook2Id=standardPriceBookId, Product2Id=pd.Id,UnitPrice = 100,isActive=true);
        insert pbe;
        Product2 p2ex = [SELECT Name FROM Product2 WHERE Id = :pd.Id];
        System.assertEquals(pd.Name,p2ex.Name);
        
		QuoteLineItem qutlineitemtest = new QuoteLineItem ();
        qutlineitemtest = new QuoteLineItem(QuoteId = quttest .id , Quantity = 3.00 ,UnitPrice = 12 , PricebookEntryId = pbe.id);
		insert qutlineitemtest;
        //PriceBook2 pb2Standard = new Pricebook2(Name='Custom Pricebook', isActive=true);
        //insert pb2Standard;
        //Id standardPriceBookId = pb2Standard.Id;

        Order od = new Order();
        od.Name = '14TPE000001';
        od.AccountId = acct.Id;
        od.EffectiveDate = Date.Today();
        od.ContractId = ct.Id;
        od.Status = 'Draft';
        od.quoteid=quttest.id;
        od.Pricebook2Id=standardPriceBookId;
        insert od;
        system.debug('od.quoteid~'+od.quoteid);
        neworderList.put(od.id,od);
        oldOrderList.put(od.id,od);
        Order od1 = new Order();
        od1.Name = '14TPE000002';
        od1.AccountId = acct.Id;
        od1.EffectiveDate = Date.Today();
        od1.ContractId = ct.Id;
        od1.Status = 'Draft';
        od1.quoteid=quttest.id;
        od1.Pricebook2Id=standardPriceBookId;
        insert od1;
        system.debug('od1.quoteid~'+od1.quoteid);
		//oldOrderList.put(od1.id,od1);

		 

		//List<PricebookEntry> pbe = new List<PricebookEntry>();
		//pbe.add(new PricebookEntry(Pricebook2Id = standardPriceBookId, Product2Id = pd.Id, IsActive = true, UnitPrice = 100));       
		//insert pbe; 
		OrderItem ordPd = new OrderItem(PriceBookEntryId=pbe.Id , OrderId=od.Id, Quantity=1, UnitPrice=99);
		insert ordPd;    
    	list<order> orderlist= [SELECT Id, Pricebook2Id FROM Order WHERE NAME LIKE '14TPE00000%' ];
		Test.startTest();
        OrderHandler ord =new OrderHandler();
        ord.updateOrderBeforeIns(orderlist);
        ord.createOrderLineitems(orderlist);
        ord.quoteChangecreateOrderLineitems(neworderList,oldOrderList);
        Test.stopTest();
    }

}