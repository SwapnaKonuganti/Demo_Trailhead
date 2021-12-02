trigger AccountAddressTrigger on Account (Before Insert, Before Update) {

for (Account o : Trigger.new) {
if (o.Match_Billing_Address__c== True && o.BillingPostalCode!=Null)
{
o.ShippingPostalCode =o.BillingPostalCode;
}
else if (o.Match_Billing_Address__c= False) {}

}

}