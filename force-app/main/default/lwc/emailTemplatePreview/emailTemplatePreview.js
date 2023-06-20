import { LightningElement,track,wire, api } from 'lwc';
import getEmailTemplate from '@salesforce/apex/EmailTemplatePreviewController.getEmailTemplate';
export default class EmailTemplatePreview extends LightningElement {

    @track emailTemplate = {};
    
    @api emailTemplateId='00X5i0000012BesEAE';
    @api recordID='0035i00000CpYpnAAF';

    @wire(getEmailTemplate,{emailTemplateId:'$emailTemplateId', recordID: '$recordID'})
    wiredData({ error, data }) {
      if (data) {
        console.log('Data', data);
        this.emailTemplate=data;
      } else if (error) {
        console.error('Error:', error);
      }
    }
}