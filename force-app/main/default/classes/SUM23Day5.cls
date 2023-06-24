//MAP
//Map is based on the Key and Value pairs.
//Key is always holds the unique infomration | data.
//Values may or may not holds the unique information.
//
//Syntax:
//since we have key and value, so the map have two datatypes for Key and value. that was
//may or may not be same, Meaning the datattype of the key and value may or may not be same.
//
//Map<Datatype_key, Datatype_value> mapName = new Map<Datatype_key, Datatype_value>();
public class SUM23Day5 {
	
    public SUM23Day5(){
        //Map<Datatype_key, Datatype_value> mapName = new Map<Datatype_key, Datatype_value>();
        
        Map<Integer, String> employeeNameById = new Map<Integer, String>();
        
        //Add value in MAP.
        employeeNameById.put(1,'Suraj');
        employeeNameById.put(2,'Jawed');
        employeeNameById.put(3,'Alp');
        System.debug('employeeNameById: ' + employeeNameById);
        //get a value from Map.
        //to get a value from a Map we need to use KEY.
        //
        String getValueFromKey = employeeNameById.get(2);//.get(key)
        System.debug('getValueFromKey: ' + getValueFromKey);
        
        //LOOP
        //WHY? to automatically extract one value from a MAP.
        /**
         * 
         * 	for(datatype_same_as_KEY|VALUE_Datatype variableName :Keys|Values){
        
        	}
         * 
		*/
        //LOOP on KEY.
        for(Integer empId :employeeNameById.keySet()){
            String employeeName = employeeNameById.get(empId);
        	System.debug('empId: ' + empId);
            System.debug('employeeName: ' + employeeName);
        }
        
        //LOOP on VALUE.
        for(String empName :employeeNameById.Values()){
        	System.debug('empName: ' + empName);
        }
    }
}