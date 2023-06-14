public class SUM23D1 {
	
    public SUM23D1(){
        //<Specity the Type of Variable> variable-name = variable-value;
        //Variable declaration with initialisation.
        String firstName = 'Suraj';
        Integer age = 30;
        
        System.debug('firstName: ' + firstName);
        System.debug('age: ' + age);
        
        
        //Variable declaration without initialisation.
        String lastName;
        System.debug('lastName: ' + lastName);
        
        lastName = 'Singh';
        System.debug('lastName: ' + lastName);
        
        //Working with Variables i.e. Operators(+)
		String fullName = firstName +  lastName;   
        System.debug('fullName: ' + fullName);
        
        fullName = firstName + ' K ' + lastName;  
        System.debug('fullName: ' + fullName);
        
        
        Integer numberOne = 23;
        Integer numberTwo = 45;
        String numberThree = '89';
        
        Integer numberPlus = numberOne + numberTwo;
        System.debug('numberPlus: ' + numberPlus);
        
        String numberStr = numberThree + numberTwo;
        System.debug('numberStr: ' + numberStr);
        
        String nameStr = firstName + numberTwo;
        System.debug('nameStr: ' + nameStr);
        
    }
}