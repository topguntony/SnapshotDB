$(function () {
  if(Graph){
      new Highcharts.Chart({  
    chart: { 
      renderTo: 'hours_chart', 
      defaultSeriesType: 'column'
    },
    title: { 
      text: Graph.title,
      style:{
        color:'#000',
        fontWeight:'bold'
      }
    },
    credits: { enabled:false },
    xAxis: {
      categories: Graph.labels,
      labels: {
        rotation:-45,
        align:'right'
      }
    },    
    yAxis: {
      allowDecimals:false,
      title: { 
        text: Graph.units,
        style: {color:'#000'}
      } 
    },
          tooltip: {
         formatter: function() {
            return '<b>'+ this.x +'</b><br/>'+
                this.series.name +': '+ this.y +'<br/>'+
                'Total: '+ this.point.stackTotal;
         }
      },
    plotOptions: {
     column: {
        stacking: 'normal'
     }
    },
    series:Graph.series
  });  

  }

});