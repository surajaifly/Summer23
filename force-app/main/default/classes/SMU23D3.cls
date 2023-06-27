/*
 * 	Public: Any other class can access the Variable and Methods but within the package.
    Private: No other class can access the Variable and Methods.
    Global: Any other class can access the Variable and Methods, also outside the package.
	

	With Sharing: Show the contents based on the security setting that is allowed to view the contents.
    Without Sharing: It will not look for the Sharing security and make the contents visible to all of the users.
    Inherited Sharing: It will get the sharing model form the Parent class or we can say Calling Class.

	public with|without|Inherited sharing class SMU23D3 {

	}

*/

public with sharing class SMU23D3 {
    
    @auraenabled(Cacheable=true)
    Public static List<Purchase_Invoice__c> getPurchaseInvoices(){
        return SUM23D3_1.getPurchaseInvoices();
    }

}