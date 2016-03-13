function putLocationsOnMap(centerPoint, locations)
{
  var mapCanvas = document.getElementById('map-canvas');
  var mapOptions = {
    center: new google.maps.LatLng(centerPoint.latitude, centerPoint.longitude),
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(mapCanvas, mapOptions);
  console.log(map);
}
function getLocationsFromSite(locations)
{
  // console.log('test')
  var jqxhr = $.get("/locations",function ajaxResultWithLocation( data ) {
         
       putLocationsOnMap(data.center_point,data.locations)
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