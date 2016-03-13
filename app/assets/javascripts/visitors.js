"use strict";
function putLocationsOnMap(map,locations)
{ var markers = []      
    for (var i = locations.length-1; i >-1; i--) {
      let marker = new google.maps.Marker({
            position: {lat: locations[i].lat,  
                       lng: locations[i].lng},
            map: map
        })      
      let infowindow = new google.maps.InfoWindow({
        content: locations[i].info
      });
      markers.push(marker);
      marker.addListener('click', function() {
        infowindow.open(map, marker)
      });
  }
}
function getNewLocations(bounds, map){ 
  var centerPoint = bounds.getCenter()   
  var jqxhr = $.get("/locations",{ northEast: bounds.getNorthEast().toJSON(),
    southWest: bounds.getSouthWest().toJSON(),
    centerPoint: centerPoint.toJSON()},function ajaxResultWithLocation( data ) {
         
       // initMap(data.center_point,data.locations)
     }
   )
   .fail(function() {
    alert( "error" );
  })
}

function initMap(centerPoint, locations)
{
  var mapCanvas = document.getElementById('map');
  var mapOptions = {
    center: new google.maps.LatLng(centerPoint.lat, centerPoint.lng),
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  let map = new google.maps.Map(mapCanvas, mapOptions)
  google.maps.event.addListener(map, 'bounds_changed', function boundsChanged() {
      var bounds = map.getBounds()
      getNewLocations(bounds, map);
  })
  putLocationsOnMap(map,locations);
}
function getLocationsFromSite(locations)
{
  var jqxhr = $.get("/locations",function ajaxResultWithLocation( data ) {
         
       initMap(data.center_point,data.locations)
     }
   )
   .fail(function() {
    alert( "error" );
  })
  
}
function initialize() {
  let locations = []
  getLocationsFromSite(locations)
  
}
$(document).ready(function() {
  google.maps.event.addDomListener(window, 'load', initialize)
})