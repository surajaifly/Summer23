import { LightningElement, track, wire } from 'lwc';

import getEmailTemplateList from '@salesforce/apex/EmailPreviewerController.getEmailTemplateList';
import getAllObjectList from '@salesforce/apex/EmailPreviewerController.getAllObjectList';

import getRecords from '@salesforce/apex/EmailPreviewerController.getRecords';
import previewEmailTemplate from '@salesforce/apex/EmailPreviewerController.previewEmailTemplate';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class EmailPreviewer extends LightningElement {

    @track allEmailTemplateList;
    @track emailFolderNameByIdOption = new Array();
    @track emailTemplateByIdOption = new Array();
    @track selectedEmailTemplateId = '';
    @track selectedObject;
    @track records;
    @track selectedRecordId;
    @track searchKey = '';

    @track subject;
    @track textPreview;
    @track htmlPreview;
    @track showPreview = false;
    @track isTRue = false;

    //Method to get the folder names and associated email templates.
    @wire(getEmailTemplateList)
    wiredEmailTemplates(result) {
        const { data, error } = result;
        if (data) {
            this.allEmailTemplateList = data;
            var tempEmailFolderNameByIdOption = new Array();
            var tempUnique = new Array();
            for (let etData of data) {
                let item = new Object();
                item.label = etData.FolderName;
                item.value = etData.FolderId;
                if (tempUnique.indexOf(etData.FolderId) === -1) {
                    tempEmailFolderNameByIdOption.push(item);
                    tempUnique.push(etData.FolderId);
                }
            }
            this.emailFolderNameByIdOption = tempEmailFolderNameByIdOption;
        } else if (error) {
            this.showNotification('ERROR', error.body.message, 'error');
        }
    }

    @wire(getAllObjectList)
    wireObjectList({ error, data }) {
        if (data) {
            console.log('objectsName: ', data);
            this.objectsName = data;
        }
        else if (error) {
            this.objectsName = new Array();
            this.showNotification('ERROR', error.body.message, 'error');
        }
    }

    @wire(previewEmailTemplate, { templateId: '$selectedEmailTemplateId', whatId: '$selectedRecordId' })
    wiredPreviewET(result) {
        const { data, error } = result;
        if (data) {
            this.showPreview = true;
            var dataObj = JSON.parse(data);
            this.textPreview = dataObj.plainTextBody;
            this.htmlPreview = dataObj.htmlBody;
            this.subject = dataObj.subject;
        } else if (error) {
            this.showNotification('ERROR', error.body.message, 'error');
        }
    }

    @wire(getRecords, { objName: '$selectedObject', searchStr: '$searchKey' })
    wiredObjectRecords(result) {
        const { data, error } = result;
        if (data) {
            console.log('getRecords:', data);
            if (data.length > 0) {
                this.records = data;
            }
            else{
                this.records = false;
            }
        }
        else if (error) {
            this.showNotification('ERROR', error.body.message, 'error');
        }
    }

    handlefolderChange(event) {
        try {
            console.log('folderId', event.target.value);
            var tempEmailTemplateByIdOption = new Array();
            for (let etData of this.allEmailTemplateList) {
                if (etData.FolderId == event.target.value) {
                    let item = new Object();
                    item.label = etData.Name;
                    item.value = etData.Id;
                    tempEmailTemplateByIdOption.push(item);
                }
            }
            this.emailTemplateByIdOption = tempEmailTemplateByIdOption;
        } catch (err) {
            this.showNotification('ERROR', error.body.message, 'error');
        }
    }

    handleEmailTempleteChange(event) {
        this.selectedEmailTemplateId = event.target.value;
    }

    handleobjectChange(event) {
        this.selectedObject = event.target.value;
    }

    onRecordSelected(event) {
        this.selectedRecordId = event.currentTarget.dataset.id;
    }

    handleSearch(event) {
        this.searchKey = event.target.value;
    }

    badgeClick(event) {
        let caseNumber = event.target.dataset.id;
        let nameValue = event.currentTarget.dataset.name;
        if (caseNumber != null) {
            for (var i = 0; i < this.records.length; i++) {
                if (caseNumber == this.records[i].CaseNumber) {
                    this.template.querySelector('[data-id="' + this.records[i].CaseNumber + '"]').classList.add('slds-theme_success');
                } else {
                    this.template.querySelector('[data-id="' + this.records[i].CaseNumber + '"]').classList.remove('slds-theme_success');
                }
            }
        }
        else {
            for (var i = 0; i < this.records.length; i++) {
                if (nameValue == this.records[i].Name) {
                    this.template.querySelector('[data-name="' + this.records[i].Name + '"]').classList.add('slds-theme_success');
                } else {
                    this.template.querySelector('[data-name="' + this.records[i].Name + '"]').classList.remove('slds-theme_success');
                }
            }
        }
    }


    showNotification(title, message, variant) {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(evt);
    }
}