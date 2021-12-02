import { LightningElement,wire,track } from 'lwc';
import{CurrentPageReference} from 'lightning/navigation';
import { fireEvent } from 'c/pubsub';
import getLeadList from '@salesforce/apex/leadcontroller.getLeadList';
import getcontactId from '@salesforce/apex/leadcontroller.getcontactId';


export default class ApexWireMethodToProperty extends LightningElement {
    @track data = [];
    @track error;
    @track selectedlds;
    @track bShowModal = false;
    @track selectedleadId;
    @track selectedLeadModal;
    @track prospectId;
    @wire(CurrentPageReference) pageRef;

    @wire(getLeadList) 
    leads(result) {
        if (result.data) {
            this.data = result.data;
            this.error = undefined;

        } else if (result.error) {
            this.error = result.error;
            this.data = undefined;
        }
    }
    allSelected(event) {
        let selectedRows = this.template.querySelectorAll('lightning-input');
        
        for(let i = 0; i < selectedRows.length; i++) {
            if(selectedRows[i].type === 'checkbox') {
                selectedRows[i].checked = event.target.checked;
            }
        }
        //this.showleads();
    }
    showleads() {
        this.bShowModal = false;
 
        this.selectedlds = [];
        
        let selectedRows = this.template.querySelectorAll('lightning-input');
        
        // based on selected row getting values of the contact
        for(let i = 0; i < selectedRows.length; i++) {
            if(selectedRows[i].checked && selectedRows[i].type === 'checkbox') {
                this.selectedlds.push({
                    Name: selectedRows[i].value,
                    Id: selectedRows[i].dataset.id
                })
                this.bShowModal = true;
                this.selectedleadId=selectedRows[i].dataset.id;
                this.selectedLeadModal=selectedRows[i].value;
                getcontactId({ leadId: this.selectedleadId})
                .then(result => {
                        this.prospectId=result;
                         fireEvent(this.pageRef, 'restaurantListUpdate', this.prospectId);
        })
        .catch(error =>{
            this.error=error;
        })
            
            }
            
            
        }

    }
}