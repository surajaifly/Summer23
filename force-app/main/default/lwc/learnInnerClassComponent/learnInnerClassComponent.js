import { LightningElement, track} from 'lwc';
import getAnimalList from '@salesforce/apex/SUM23Day3.getAnimalList';


export default class LearnInnerClassComponent extends LightningElement {
    @track animalName;
    @track animalList;
    @track error;

    
    handleInputChange(event){
        this.animalName = event.target.value;
    }

    handleClick(){
        //IMPERATIVE CALL
        getAnimalList({animalName : this.animalName})
            .then(result => {
                console.log('result', result);
                this.animalList = result;
            })
            .catch(error => {
                console.log('error', error);
                this.error = error;
            });
    }
    
}