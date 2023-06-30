public class SUM23Day4 {
    //sObject in Apex.
    /*
     * 
     * "sObject obj" ===> "datatype variableName".
     * 	sObject obj = new sObject(); '= new', means that we are allocating memory to the variable. 
		obj.fieldName = value;, 'Using the DOT operator we are accessing the FieldName'.

		We are Using sObject in Apex to perform DML(INSERT, UPDATE, and DELETE).
     * */
    public SUM23Day4(){
        /*
        Lead ldObj = new Lead();
        ldObj.FirstName = 'Suraj';
        ldObj.LastName = 'Test';
        ldObj.Email = 'test@code.com';
        ldObj.Company = 'apex';
        //...
        INSERT ldObj;
		*/
        
        Furniture__c furnitureObj = new Furniture__c();
        furnitureObj.Name = '4 X 4 Desk';
        furnitureObj.Type__c = 'Chairs';
        furnitureObj.Price__c = 234.98;
        furnitureObj.Size__c = '60 X 60 X 29';
        furnitureObj.Materials__c = 'Metal'; 
        //...
        INSERT furnitureObj;
    }
}