({
    scriptsLoaded : function(component, event, helper) {
        debugger;
        var action = component.get("c.getAllTasksByStatus");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                let val = response.getReturnValue() ;
                var labelset=[] ;
                var dataset=[] ;
                val.forEach(function(key) {
                    labelset.push(key.label) ; 
                    dataset.push(key.count) ; 
                });
                new Chart(document.getElementById("pie-chart"), {
                    type: 'doughnut',
                    data: {

                        datasets: [{
                            label: "Count of Task",
                            backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
                            data: dataset
                        }]
                    },
              options: {
                        title: {
                            display: true,
                            text: 'Total Task completion',
                            x:12,y:23,

                            
                        },}
                });
                Chart.pluginService.register({
                    
                    beforeDraw: function(chart) {
                        var width = chart.chart.width,
                            height = chart.chart.height,
                            ctx = chart.chart.ctx;
                        
                        ctx.restore();
                        var fontSize = (height / 184).toFixed(2);
                        ctx.font = fontSize + "em sans-serif";
                        ctx.textBaseline = "middle";
                        
                        var text = "75%",
                            textX = Math.round((width - ctx.measureText(text).width) / 2),
                            textY = (height / 2);
                        
                        ctx.fillText(text, textX, textY);
                        var text1 = "Completed",
                            textX = Math.round((width - ctx.measureText(text1).width) / 2),
                            textY = (height / 2);
                        
                        ctx.fillText(text1, textX+5, textY+20);
                        ctx.save();
                    }
                });
            }
        });
        $A.enqueueAction(action);
        
    }
})