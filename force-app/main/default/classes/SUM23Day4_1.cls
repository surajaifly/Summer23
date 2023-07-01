public class SUM23Day4_1 {
	//LIST in Apex.
	//It is a collection that holds multiple values of Same Datatype.

    public SUM23Day4_1(){
        //Declaration of List.
        //List<Datatype> listVariableName = new List<Datatype>();
        //List<Datatype> listVariableName; //'This variable is NULL'
        
        //String firstName;
        List<String> firstNameList = new List<String>();
        
        
        //firstName = 'Suraj';
        //How to add value in a list.
        firstNameList.add('Suraj'); //0th position of List
        firstNameList.add('Alp'); //1st position of List
        firstNameList.add('Jawed'); //2nd position of List
        firstNameList.add('Asol'); //3rd position of List
        firstNameList.add('Nataliya'); //4th position of List
         
        System.debug('@@##' + firstNameList);
        
        //Extract a Value from List.
        String extractJawed = firstNameList.get(2);
        System.debug('Extracted Value at 2: ' + extractJawed);
        
        //LOOP on List.
        //WHY? to automatically extract one value from a list.
        /**
         * 
         * 	for(datatype_same_as_list_Datatype variableName :listName){
        
        	}
         * 
		*/
        
        for(String firstName :firstNameList){
            System.debug('firstName from List: ' + firstName);
        }
    }
}