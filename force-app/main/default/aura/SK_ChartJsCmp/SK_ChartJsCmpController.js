({
	doInit : function(component, event, helper) {
        var params ={};
		helper.callToServer(
        	component,
            "c.findDataSetForChart",
            function(response)
            {	
                console.log('apex response :'+JSON.stringify(response));
                component.set("v.ltngChartData",response);
                
                //display line chart
                helper.generateChartData(component,"doughnut","doughnutChartSection");
            }, 
            params
		);
    }
})