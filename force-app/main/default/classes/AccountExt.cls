public with sharing class AccountExt {

    public ApexPages.StandardController record;
    public AccountExt(ApexPages.StandardController controller) {
    // testing for demo
    record=controller;
    }
    
    public pagereference dosave(){
    record.save();
    return (new Pagereference('/apex/AccountTest').Setredirect(true));
    }

}