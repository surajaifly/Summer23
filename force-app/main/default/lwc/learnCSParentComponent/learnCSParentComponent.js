import { LightningElement, track } from 'lwc';

export default class LearnCSParentComponent extends LightningElement {

    @track valueFromChild;
    handleCustomEvent(event){
        //Handle the child event, and get the information form the event.
        console.log('value from Child', event.detail);
        this.valueFromChild = event.detail;
    }
}