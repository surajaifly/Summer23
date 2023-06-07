import { LightningElement, track, api } from 'lwc';

export default class LearnApiDecoratorFirstCmp extends LightningElement {
    @api valueFromMetaXML;


    @track valueOfFirstCmp = 'Send it to Second.';
}