import { LightningElement, wire, track } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';

export default class LearnWireDecoratorCmp extends LightningElement {

    @track showUIElement = true;

    @track firstNames = ['Suraj', 'Alan', 'Sanjay', 'Sukhay', 'Alap']; 
    //Here square brackets, which means that it going to have multiple information.

    //In this example, we are going to show name with dfferent Icons.
    @track nameWithIcons = [
        {name: 'Suraj', icon: "standard:contact"},
        {name: 'Alan', icon: "standard:account"},
        {name: 'Sukhay', icon: "standard:lead"},
        {name: 'Sanjay', icon: "standard:opportunity"},
        {name: 'Alap', icon: "standard:contact"}
    ];

    @track contacts;
    @track error;


    @wire(getContactList)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }

    showAvatar(){
        this.showUIElement = true;
    }

    hideAvatar(){
        this.showUIElement = false;
    }
}