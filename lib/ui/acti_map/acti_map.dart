import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OfflineMap extends StatelessWidget {
  static const String route = '/offline_map';

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offline Map')),
//    drawer: buildDrawer(context, route),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                  'This is an offline map that is showing Anholt Island, Denmark.'),
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
//                center: LatLng(56.704173, 11.543808),
                  minZoom: 12.0,
                  maxZoom: 14.0,
                  zoom: 13.0,
//                swPanBoundary: LatLng(56.6877, 11.5089),
//                nePanBoundary: LatLng(56.7378, 11.6644),
                ),
                layers: [
                  TileLayerOptions(
                    tileProvider: AssetTileProvider(),
                    maxZoom: 14.0,
                    urlTemplate: 'assets/map/anholt_osmbright/{z}/{x}/{y}.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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

//  @override
//  Widget build(BuildContext context) {
    String html =
        '<h1>This is heading 1</h1> <h2>This is heading 2</h2><h3>This is heading 3</h3><h4>This is heading 4</h4><h5>This is heading 5</h5><h6>This is heading 6</h6><p><img alt="Test Image" src="https://i.ytimg.com/vi/RHLknisJ-Sg/maxresdefault.jpg" /></p>';
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Plugin example app'),
//      ),
//      body: SingleChildScrollView(
//        child: Center(
////          child:  HtmlView(data: html),
//            child: WebView(
////              key: _key,
//          javascriptMode: JavascriptMode.unrestricted,
////              initialUrl: _url,
//        )),
//      ),
//    );
//  }

  WebViewController _controller;

//  @override
//  Widget build(BuildContext context) {
//    _loadHtmlFromAssets();
//    return Scaffold(
//      appBar: AppBar(title: Text('Help')),
//      body: WebView(
//        initialUrl: '',
//        onWebViewCreated: (WebViewController webViewController) {
//          _controller = webViewController;
//        },
//      ),
//    );
//  }
//
//  _loadHtmlFromAssets() async {
//    String fileText = await rootBundle.loadString('assets/help.html');
//    _controller.loadUrl(
////        Uri.dataFromString(fileText,
////            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
////        .toString()
//        Uri.dataFromString('<html><body>$html</body></html>',
//                mimeType: 'text/html')
//            .toString());
//  }
}
