import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessToken = "pk.eyJ1IjoibW1kYWhtZHZuZCIsImEiOiJjbGFwMjRyY2QxNXFjM3JvYm1sYXZ2NDJlIn0.JvuCl3FiuTXiv4whVs_zZw";
    var id_ = "mapbox.mapbox-streets-v8";
    var integrationUrl = "https://api.mapbox.com/styles/v1/mmdahmdvnd/clap3xoiq004k15p6i3uqv8f9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibW1kYWhtZHZuZCIsImEiOiJjbGFwMjRyY2QxNXFjM3JvYm1sYXZ2NDJlIn0.JvuCl3FiuTXiv4whVs_zZw";
    return FlutterMap(
      options: MapOptions(
        center: latLng.LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: integrationUrl,
          additionalOptions: {
              'accessToken': '<$accessToken>',
              'id': id_,
           },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: latLng.LatLng(51.5, -0.09),
              builder: (context) =>
              const FlutterLogo(),
            ),
          ],
        ),
      ]
    );
  }
}
