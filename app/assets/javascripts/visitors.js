function putLocationsOnMap(locations)
{
  locations
}
function getLocationsFromSite(locations)
{
  // console.log('test')
  var jqxhr = $.get("/locations",function ajaxResultWithLocation( data ) {
         
       for(i=0;i<data.length;i++)
       {         
         locations.push(data[i])        
       }
     }
   )
   .fail(function() {
    alert( "error" );
  })
  
}
function initialize() {
  locations = []
  getLocationsFromSite(locations)
  
}
$(document).ready(function() {
  google.maps.event.addDomListener(window, 'load', initialize)
})