import { LightningElement,api } from 'lwc';

export default class LeadDetails extends LightningElement {
    @api recordId;
    @api selectedLeadModal;
}