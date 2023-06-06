import { LightningElement, track } from 'lwc';

export default class LearnTrackDecoratorCmp extends LightningElement {

    @track firstName = 'Suraj'; //here 'firstname is called Variable and 'Suraj' is called as Value of the Variable.'
    @track age = 30; //here 'age is called Variable and '30' is called as Value of the Variable.'
    //here, I used single-inverted commas for Text, and 
    //for other one we don't have to used single-inverted commas.

    @track email = 'suraj@gmail.com';
    @track salary = 12589.45;

    @track birthdate = new Date(1992, 0, 2);//YYYY, MM, DD -== GMT or UTC

    @track lastName = 'Singh';


    handleInputChange(event) {
        //This console.log is used to see the values in the JS Controller.
        console.log('value is ', event.detail.value);
    }

    handleBlur(event) {
        console.log('Event executed');
        console.log('value is ', event.target.value);
        this.lastName = event.target.value;
    }

    get surkheyMethodDate(){
        const date = new Date(1992, 0, 2);
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        const formattedDate = `${month}/${day}/${year}`;
        return formattedDate;
    }
}