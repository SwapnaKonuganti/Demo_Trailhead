({
    generateChart : function(component, event, helper) {
        var chartdata = {
            labels: ['Tuesday', 'Wednesday'],
            datasets: [
                {
                    label:'Day',
                    data: [110, 290],
                    backgroundColor: [
                        "#FF6384",
                        "#63FF84",
                        "#84FF63",
                        "#8463FF",
                        "#6384FF"
                    ],
                    fill: false,
                    pointBackgroundColor: "#FFFFFF",
                	pointBorderWidth: 4,
                	pointHoverRadius: 5,
                	pointRadius: 3,
                    getValueForPixel:23,
                	bezierCurve: true,
                	pointHitRadius: 10
                    
                }
            ]
			
        }
        //Get the context of the canvas element we want to select
        var ctx = component.find("doughnutChart").getElement();
        var lineChart = new Chart(ctx ,{
            type: 'doughnut',
            data: chartdata,
            options: {	
                legend: {
                    position: 'left',
                    padding: 10,
                },
                responsive: true
            }
        });
        var ctx = component.find("doughnutChart1").getElement();
        var lineChart = new Chart(ctx ,{
            type: 'doughnut',
            data: chartdata,
            options: {	
                legend: {
                    position: 'left',
                    padding: 10,
                },
                responsive: true
            }
        });
        var ctx = component.find("doughnutChart2").getElement();
        var lineChart = new Chart(ctx ,{
            type: 'doughnut',
            data: chartdata,
            options: {	
                legend: {
                    position: 'left',
                    center:{text:'20'},
                    padding: 10,
                },
                responsive: true
            }
        });
	},
    
})