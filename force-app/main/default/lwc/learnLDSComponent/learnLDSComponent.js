import { LightningElement, track } from 'lwc';

import NAME_FIELD from '@salesforce/schema/Contact.Name';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import MOBILE_FIELD from '@salesforce/schema/Contact.MobilePhone';


export default class LearnLDSComponent extends LightningElement {

    @track objectApiName = 'Contact';
    @track fields =[NAME_FIELD, PHONE_FIELD, EMAIL_FIELD, MOBILE_FIELD];

}