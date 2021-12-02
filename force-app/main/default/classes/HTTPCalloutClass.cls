public class HTTPCalloutClass {
    
    Public HTTPCalloutClass (){
        //HTTP Request 
        HTTPRequest Req = new HTTPRequest();
        Req.setEndpoint('http://api.androidhive.info/contacts/');
        Req.setMethod('GET');
        
        HTTP http1= new HTTP();
        HTTPResponse res= http1.send(Req);
        
        String responsBody= res.getBody();
        System.debug('Response is ---->'+responsBody);
        
        JSONParser parser = JSON.createParser(responsBody);
        
        System.JSONToken token;
        string text;
        
        parser.nextToken(); // Eat first Start Object {
        
        List<String> Ids= new List<String>();
        List<String> Names= new List<String>();
        List<String> Emails= new List<String>();                
        
        lstw = new List<WrapContacts>(); 
        While ((token=parser.nextToken())!= null){

            //parse the object
            if ((token=parser.getCurrentToken())!= JSONToken.END_OBJECT){
                text= parser.getText();

                if (token==JSONToken.FIELD_NAME && text=='id'){
                    token=parser.nextToken();
                    Ids.add(Parser.getText());
                    //objw.id=parser.getText();
                }else if(token==JSONToken.FIELD_NAME && text=='name'){
                    token=parser.nextToken();
                    Names.add(Parser.getText());                        
                    //objw.Name=parser.getText();
                }else if(token==JSONToken.FIELD_NAME && text=='email'){
                    token=parser.nextToken();
                    Emails.add(parser.getText());
                    //objw.Email=parser.getText();
                }
            }

        }
        
            for(Integer i=0;i<Ids.Size();i++){
            objw= new WrapContacts();
            objw.id= Ids[i];
            objw.Name=Names[i];
            objw.Email=Emails[i];
            lstw.add(objw);
            }        
            }
    
    Public List <WrapContacts> lstw{get;set;}
    Public WrapContacts objw{get;set;}
    Public class WrapContacts{
        Public string id{get;set;}
        Public string Name{get;set;}
        Public string Email{get;set;}
    }

}