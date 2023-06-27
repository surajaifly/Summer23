public class SUM23Day4_2 {
	//SET in Apex.
	//It is a collection that holds multiple values of Same Datatype.
	//But it will not holds the duplicate values.
	//
    public SUM23Day4_2(){
		Set<String> firstNameSet = new Set<String>();
        
        
        //firstName = 'Suraj';
        //How to add value in a set.
        firstNameSet.add('Suraj'); 
        firstNameSet.add('Alp'); 
        firstNameSet.add('Jawed'); 
        firstNameSet.add('Asol'); 
        firstNameSet.add('Nataliya');
         
        System.debug('@@##' + firstNameSet);
        
        firstNameSet.add('Jawed');
        System.debug('@@##' + firstNameSet);
        
        //LOOP on Set.
        //WHY? to automatically extract one value from a Set.
        /**
         * 
         * 	for(datatype_same_as_set_Datatype variableName :setName){
        
        	}
         * 
		*/
        
        for(String firstName :firstNameSet){
            System.debug('firstName from List: ' + firstName);
        }
    }
}