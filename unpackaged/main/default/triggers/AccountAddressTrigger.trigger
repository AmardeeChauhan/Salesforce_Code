trigger AccountAddressTrigger on Account (before insert,before update) {
    
  for (Account accountObj : Trigger.new) {
      if(accountObj.Match_Billing_Address__c)
      {
          accountObj.ShippingPostalCode = accountObj.BillingPostalCode;
      }
}
}