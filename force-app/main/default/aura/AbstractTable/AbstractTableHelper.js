({
	handleLoadTable : function(component,parms,action){
		//Tells whether or not to display the modal
		component.set("v.processing",true);

        //Use the abstract component's helper method to call the Apex getPayments method.
		this.handleAction(
			component,
			parms,
			action,
			this.handleLoadTableCallback
		);
	},
	//Logic to run on success.
	handleLoadTableCallback : function(component, returnValue, ctx){
		component.set("v.records",returnValue);
	}
})