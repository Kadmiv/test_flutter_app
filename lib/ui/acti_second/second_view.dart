import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_app/resources/strings.dart';

class SecondView extends StatefulWidget {
  final String text;

  SecondView({Key key, @required this.text}) : super(key: key);

  @override
  SecondViewState createState() {
    return SecondViewState();
  }
}

class SecondViewState extends State<SecondView> {
  @override
  Widget build(BuildContext context) {
    print("Text in second view : ${widget.text}");
    return Scaffold(
      appBar: AppBar(title: Text(Strings.second_text)),
      body: Center(
          child: RaisedButton(
              onPressed: () {
                var text = "${widget.text}";
                Navigator.of(context).pop(text);
              },
              child: Text(widget.text))),
    );
  }
}

//
//// Создаём состояние виджета
//class _SecondViewState extends State<SecondView> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(title: Text(Strings.main_text)), body: MyHomePage());
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return MyHomePageState();
//  }
//}
//
//class MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Center(child: new Text("Второе окно"));
//  }
//}
