public class AddPrimaryContact implements Queueable {
    Private Contact c;
    Private string State;
    Public AddPrimaryContact(Contact c, String state){
        this.c=c;
        this.state=state;
    }
    Public void execute(QueueableContext Context){
        List<Account> ListAccount = [SELECT ID, Name ,(Select id,FirstName,LastName from contacts ) FROM ACCOUNT WHERE BillingState = :state LIMIT 200];
        List<contact> listcont=new List<contact>();
        for(Account acc: ListAccount){
            contact con=c.clone(false,false,false,false);
            con.Accountid=acc.id;
            listcont.add(con);
        }
        if(listcont.size()>0){
            insert listcont;
        }

    }

}