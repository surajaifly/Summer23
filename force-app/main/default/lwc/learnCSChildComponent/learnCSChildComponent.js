import { LightningElement, track } from 'lwc';

export default class LearnCSChildComponent extends LightningElement {

    @track inputValue;

    handleInputChange(event){
        //receive data from HTML file.
        this.inputValue = event.detail.value;
    }

    handleButtonClick(event){
        //send data to parent component.

        // Prevent default behavior of click.
        event.preventDefault();

        //Defining the custom event.
        const customEventName = new CustomEvent('childinput', 
            { detail: this.inputValue }
        );

        //Executing the custom event.
        this.dispatchEvent(customEventName);

    }
}