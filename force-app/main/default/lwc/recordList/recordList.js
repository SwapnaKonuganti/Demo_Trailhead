import { LightningElement, api, track } from 'lwc';
import searchRecords from '@salesforce/apex/CustomLookupController.searchRecords';

const columns = [  
    { label: 'Name', fieldName: 'Id', type:'url',typeAttributes: {label: { fieldName: 'Name' }, 
        target: '_self'}, wrapText: true   }, 
        { label: 'Phone Number', fieldName: 'Phone' },  
    { label: 'Email', fieldName: 'Email' },  
];  

export default class Customlwclookup extends LightningElement {

    /* public property */
    /* these public property will be used when using this component inside other component for the lookup functionality */
    /* objectName is the name of the Object which is parent either master-detail or lookup */
    /* fieldName is the field of parent object in which text needs to be searched */
    /* iconname - icon to display in the list and after selection of the record */
    /* label - to show the label for the lookup */
    /* parentidfield - the apiname of lookup/matser-detail in the child object this field is useful to indentify which parent record has been select if there are multiple lookup for a single child record */
    @api objectName = 'Account';
    @api fieldName  = 'Name';
    @api iconname   = 'standard:record';
    @api label      = 'Global Search';
    @api parentidfield = 'AccountId';
    @track columns = columns; 

    /* private property */
    @track records;
    @track leadrecords;
    @track opprecords;
    @track selectedRecord;

    hanldeSearch(event) {

        var searchVal = event.detail.value;

        searchRecords({
            objName   : this.objectName,
            fieldName : this.fieldName,
            searchKey : searchVal
        })
        .then( data => {
            debugger;
            if ( data ) {
                let parsedResponse = JSON.parse(data);
                //let searchRecordList = parsedResponse[1];
                //for ( let i=0; i < searchRecordList.length; i++ ) {
                for ( let i=0; i < parsedResponse.length; i++ ) {
                      //let record = searchRecordList[i];
                      let record = parsedResponse[i];
                      //record.Name = record[this.fieldName];
                      //record.Name = record[i].Name;
                      //record.Id = record[i].Id;
  
                }
                //window.console.log(' data ', searchRecordList);
                //this.records = searchRecordList;
                this.records = parsedResponse;
                this.leadrecords=parsedResponse[0];
                this.opprecords=parsedResponse[1];

            }
        })
        .catch( error => {
            window.console.log(' error ', error);
        });
    }

    handleSelect(event) {
        debugger;
        var selectedVal = event.detail.selRec;
        this.selectedRecord =  selectedVal;
        let finalRecEvent = new CustomEvent('select',{
            detail : { selectedRecordId : this.selectedRecord.Id, parentfield : this.parentidfield }
        });
        this.dispatchEvent(finalRecEvent);
    } 

    handleRemove() {
        this.selectedRecord =  undefined;
        this.records = undefined;
        let finalRecEvent = new CustomEvent('select',{
            detail : { selectedRecordId : undefined, parentfield : this.parentidfield }
        });
        this.dispatchEvent(finalRecEvent);
    }
    
}