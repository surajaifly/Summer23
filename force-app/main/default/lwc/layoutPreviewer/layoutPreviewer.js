import { LightningElement } from 'lwc';

import layoutroot from '@salesforce/resourceUrl/layoutroot';
import { loadStyle } from 'lightning/platformResourceLoader';

export default class LayoutPreviewer extends LightningElement {

    connectedCallback() {
        loadStyle(this, layoutroot); 
    }
}