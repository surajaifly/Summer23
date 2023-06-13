import { LightningElement } from 'lwc';

export default class LearnLCHChildCmp extends LightningElement {
    constructor(){
        super();
        console.log('Constructor of Child Component');
    }

    connectedCallback(){
        console.log('connectedCallback of Child Component');
    }

    renderedCallback(){
        console.log('renderedCallback of Child Component');
    }

    disconnectedCallback(){
        console.log('disconnectedCallback of Child Component');
    }

    errorCallback(){
        console.log('errorCallback of Child Component');
    }
}