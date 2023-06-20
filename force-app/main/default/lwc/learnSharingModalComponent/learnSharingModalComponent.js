import { LightningElement, track, wire } from 'lwc';
import getPurchaseInvoices from '@salesforce/apex/SMU23D3.getPurchaseInvoices';

const columns = [
    { label: 'Invoice Numnber', fieldName: 'Name' },
    { label: 'Customer', fieldName: 'Customer__c' },
    { label: 'Total Amount to Pay', fieldName: 'Total_Amount_to_Pay__c', type: 'currency' },
    { label: 'Total Quantity Sold', fieldName: 'Total_Quantity_Sold__c' }
];
export default class LearnSharingModalComponent extends LightningElement {

    @track invoiceList;
    @track error;
    @track columns = columns;

    @wire(getPurchaseInvoices)
    wiredInvoices({ error, data }) {
        if (data) {
            this.invoiceList = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.invoiceList = undefined;
        }
    }
}