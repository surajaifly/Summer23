public class SUM23D2 {
	
    public SUM23D2(){
        //sum_void();
        //Integer sumValue = sum_return();
        //System.debug('sumValue: ' + sumValue);
        //
        Integer numberOne = 23;
        Integer numberTwo = 45;
        Integer numberThree = 56;
        sum_void(numberOne, numberTwo);
        
        Integer sumValue = sum_return(numberOne, numberTwo);
        Integer totalSum = sum_return(sumValue, numberThree);
        System.debug('sumValue: ' + totalSum);
    }
    
    public void sum_void(){
        Integer numberOne = 23;
        Integer numberTwo = 45;
        Integer sum = numberOne + numberTwo;
        
        System.debug('sum: ' + sum);
    }
    
    public void sum_void(Integer numberOne, Integer numberTwo){
        //Integer numberOne = 23;
        //Integer numberTwo = 45;
        Integer sum = numberOne + numberTwo;
        
        System.debug('void sum: ' + sum);
    }
    
    
    public Integer sum_return(){
        Integer numberOne = 23;
        Integer numberTwo = 45;
        Integer sum = numberOne + numberOne;
        
        return sum;
    }
    
    //Parameterized.
    public Integer sum_return(Integer numberOne, Integer numberTwo){
        //Integer numberOne = 23;
        //Integer numberTwo = 45;
        Integer sum = numberOne + numberTwo;
        
        return sum;
    }
}