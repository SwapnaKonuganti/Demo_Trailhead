public class OrderHandler{

public map<id,list<orderItem>> ordItemMap {get;set;}
public map<id,id> quoteIdmap {get;set;}
public map<id,id> OrderIdmap {get;set;}
public list<orderitem> orderitemlist {get;set;}
public map<id,QuoteLineItem> mapQuoteItem {get;set;}

Public OrderHandler(){

}

public list<order> updateOrderBeforeIns(list<order> ordList){
    system.debug('ordList~'+ordList);
list<order> uoOrderList = new list<order>();
    pricebook2 pbk = [select id,IsStandard from pricebook2 where IsStandard = true];
    for(order ord: ordList){
        ord.pricebook2id = pbk.id;
        uoOrderList.add(ord);
        system.debug('update scenario');
    }
    return uoOrderList;
}

Public PageReference createOrderLineitems(list<order> orderList){
    quoteIdmap = new map<id,id>();
    OrderIdmap = new map<id,id>();
    for( order ord:orderList){
        if(ord.quoteid != null){
            quoteIdmap.put(ord.quoteid,ord.id); 
            OrderIdmap.put(ord.id,ord.quoteid);
        }
        
    }
    
    system.debug('map id of order quote'+ quoteIdmap);
    list<QuoteLineItem> qtItem = [select id,quoteid,pricebookentryid,product2id,quantity,unitprice from QuoteLineItem where quoteid = : quoteIdmap.keySet()];
    system.debug('quote items'+ qtItem);
    mapQuoteItem = new map<id,QuoteLineItem>();
    for(quotelineitem qt: qtItem ){
        mapQuoteItem.put(qt.quoteid,qt);    
    }
    orderitemlist = new list<orderitem> ();
    for(quotelineitem tq:qtItem ){
    orderitem orderitemtemp = new orderitem();
        orderitemtemp.orderid = quoteIdmap.get(tq.quoteid);
        orderitemtemp.pricebookentryid = tq.pricebookentryid;
        orderitemtemp.product2id = tq.product2id;
        orderitemtemp.quantity = tq.quantity;
        orderitemtemp.unitprice = tq.unitprice;
        orderitemlist.add(orderitemtemp); 
    }
    system.debug('map of quotelineitem'+mapQuoteItem);
    system.debug('map of orderlineitem'+orderitemlist);
    insert orderitemlist;
    return null;
}

Public PageReference quoteChangecreateOrderLineitems(map<id,order> neworderList, map<id,order> oldOrderList){
    map<id,order> orderNewMap = new map<id,order>();
    map<id,order> orderOldMap = new map<id,order>();
    list<order> ordLinecr = new list<order>();
    set<id> delOrdLinOrdId = new set<id>();
    list<orderitem> deleteOrderItem = new list<orderItem>();
    orderNewMap = neworderList;
    orderOldMap = oldOrderList;
    system.debug('orderNewMap.keySet()~'+orderNewMap.keySet());
    system.debug('orderOldMap.keySet()~'+orderOldMap.keySet());
    for(id ordid: orderNewMap.keySet()){
        system.debug('orderOldMap.get(ordid).quoteid~'+orderOldMap.get(ordid).quoteid);
    	system.debug('orderNewMap.get(ordid).quoteid~'+orderNewMap.get(ordid).quoteid);

        if(orderNewMap.get(ordid).quoteid != orderOldMap.get(ordid).quoteid){
            delOrdLinOrdId.add(ordid);            
        }
        
        if(orderNewMap.get(ordid).quoteid != null && (orderOldMap.get(ordid).quoteid == null || orderOldMap.get(ordid).quoteid != null)){
            ordLinecr.add(orderNewMap.get(ordid));
        }
        

    }
    
    if(delOrdLinOrdId.size()>0){
        deleteOrderItem = [select id,orderid from orderitem where orderid = : delOrdLinOrdId ];
        delete deleteOrderItem;
    }
    
    if(ordLinecr.size()>0){
        createOrderLineitems(ordLinecr);
    }
        
    
    
    system.debug('neworderList'+neworderList+'oldOrderList'+oldOrderList);
    
    //To delete order lineitems when a quote is changed
    
    
return null; 
}

}