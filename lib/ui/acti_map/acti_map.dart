import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:latlong/latlong.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => new _MapViewState();
}

class _MapViewState extends State<MapView> {
  var points = [
    new LatLng(45.523970, -122.663081),
    new LatLng(45.528788, -122.684633),
    new LatLng(45.528864, -122.667195)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: new Text('Leaflet Maps')),
        body: new FlutterMap(
            options: new MapOptions(
//              minZoom: 10.0,
              maxZoom: 50.0,
              center: LatLng(40.71, -74.00),
            ),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new PolylineLayerOptions(
                polylines: [new Polyline(points: points)],
              ),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(40.73, -74.00),
                    builder: (context) => new Container(
                          child: IconButton(
                            icon: Icon(Icons.location_on),
                            color: Colors.red,
                            iconSize: 45.0,
                            onPressed: () {
                              print('Marker tapped');
                            },
                          ),
                        ))
              ]),
            ]));
  }
}

//
//  @override
//  Widget build(BuildContext context) {
//    return new FlutterMap(
//      options: new MapOptions(
////        center: new LatLng(51.5, -0.09),
//        zoom: 13.0,
//      ),
//      layers: [
//        new TileLayerOptions(
//          urlTemplate: "https://api.tiles.mapbox.com/v4/"
//              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
//          additionalOptions: {
//            'accessToken': '<PUT_ACCESS_TOKEN_HERE>',
//            'id': 'mapbox.streets',
//          },
//        ),
//        new MarkerLayerOptions(
//          markers: [
//            new Marker(
//              width: 80.0,
//              height: 80.0,
////              point: new LatLng(51.5, -0.09),
//              builder: (ctx) => new Container(
//                child: new FlutterLogo(),
//              ),
//            ),
//          ],
//        ),
//      ],
//    );
//  }
