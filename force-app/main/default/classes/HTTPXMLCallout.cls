public class HTTPXMLCallout {
    
    Public HTTPXMLCallout(){
        HTTPRequest req= new HTTPRequest();
        req.setEndpoint('http://api.androidhive.info/pizza/?format=xml');
        req.setMethod('GET');
        
        HTTP http1= new HTTP();
        HTTPResponse res =http1.send(req);
        
        String Response = res.getBody();
        
        //XML Parsing
        DOM.Document doc=new DOM.Document();
        doc.load(Response);
        
        lstpz = new List<WrapperPizza>();
        //looping through each node in parent
        for(DOM.XmlNode rootnode: doc.getRootElement().getChildElements()){
            objpz = new WrapperPizza();
            integer i=0;
            for(DOM.XmlNode childNodes : rootnode.getChildElements()){
                if(i==0){
                    objpz.id=childNodes.getText();
                }
                if(i==1){
                    objpz.Name=childNodes.getText();
                }
                if(i==2){
                    objpz.cost=childNodes.getText();
                }
                if(i==3){
                    objpz.description=childNodes.getText();
                }
                i++;
            }
            lstpz.add(objpz);
        }
        
    }
    
    Public WrapperPizza objpz{get;set;}
    Public List<WrapperPizza> lstpz{get;set;}
    Public class WrapperPizza{
        Public string id{get;set;}
        Public string Name{get;set;}
        Public string cost{get;set;}
        Public string description{get;set;}
    }

}