({
    generateChart : function(component, event, helper) {
    	Highcharts.chart('container2', {
            chart: {
                type: 'solidgauge'
            },
            title: null,
            
            pane: {
                center: ['50%', '85%'],
                size: '140%',
                startAngle: -90,
                endAngle: 90,
                background: {

                    innerRadius: '60%',
                    outerRadius: '100%',
                    shape: 'arc'
                }
            },
                tooltip: {
        		enabled: false
                },
            
            // the value axis
            yAxis: {
                stops: [
                    [0.1, '#55BF3B'], // green
                    [0.5, '#DDDF0D'], // yellow
                    [0.9, '#DF5353'] // red
                ],
                lineWidth: 0,
                minorTickInterval: null,
                tickAmount: 2,
                title: {
                    y: -70
                },
                labels: {
                    y: 16
                }
            },
            plotOptions: {
        solidgauge: {
            dataLabels: {
                y: 5,
                borderWidth: 0,
                useHTML: true
            }
        }
    }
          });
	},

})