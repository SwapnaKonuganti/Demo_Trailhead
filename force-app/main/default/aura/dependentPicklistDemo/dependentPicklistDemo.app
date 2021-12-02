<aura:application controller="DependentPicklistDemoController">
    <aura:attribute name="accountId" type="String" default=""/>
    <aura:attribute name="accountOptions" type="Account[]"/>
    <aura:attribute name="contactId" type="String" default=""/>
    <aura:attribute name="contactOptions" type="Contact[]"/>
    
    <!-- Application-level event handlers -->
    <aura:handler name="init" value="{!this}" action="{!c.handleInit}"/>
    
    <!-- Application title header -->
    <h1>Dependent Picklist Demo</h1>
    
    <!-- Controlling Account picklist -->
    <div>
        <h2>Account</h2>
        <select aura:id="account" onchange="{!c.handleAccountChange}">
            <option>--None--</option>
            <aura:iteration items="{!v.accountOptions}" var="option">
                <option value="{!option.value}">{!option.label}</option>
            </aura:iteration>
        </select>
    </div>
    
    <!-- Dependent Contact picklist -->
    <div>
        <h2>Contact</h2>
        <select aura:id="contact">
            <option>--None--</option>
            <aura:iteration items="{!v.contactOptions}" var="option">
                <option value="{!option.value}">{!option.label}</option>
            </aura:iteration>
        </select>
    </div>
</aura:application>