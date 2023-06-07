import { LightningElement, api } from 'lwc';

export default class LeadApiDecoratorSecondComponent extends LightningElement {
    @api valueFromFirstCmp;
}