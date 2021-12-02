import { LightningElement,track,wire } from 'lwc';
import{CurrentPageReference} from 'lightning/navigation';
import { registerListener, unregisterAllListeners } from 'c/pubsub';

export default class LwcLeadAccount extends LightningElement {
    @track accountId;
    @wire(CurrentPageReference) pageRef;
    connectedCallback() {
        //this.pageRef = pageRef;
        if(this.pageRef)  
        registerListener('restaurantListUpdate' 
                     ,this.handleRestaurants, 
                     this);
        }
        
        disconnectedCallback() {
           unregisterAllListeners(this);
        }
    handleRestaurants(propectId)
    {
        this.accountId=propectId;
    } 
    
}