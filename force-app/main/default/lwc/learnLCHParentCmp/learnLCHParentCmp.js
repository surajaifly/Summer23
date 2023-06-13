import { LightningElement, track } from 'lwc';

export default class LearnLCHParentCmp extends LightningElement {
    @track showChildCMP = true;

    constructor(){
        super();
        console.log('Constructor of Parent Component');
    }

    connectedCallback(){
        console.log('connectedCallback of Parent Component');
    }

    renderedCallback(){
        console.log('renderedCallback of Parent Component');
    }

    disconnectedCallback(){
        console.log('disconnectedCallback of Parent Component');
    }

    errorCallback(){
        console.log('errorCallback of Parent Component');
    }

    handleShowHideClick(){
        this.showChildCMP = !this.showChildCMP;
    }
}