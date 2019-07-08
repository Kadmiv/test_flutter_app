import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_app/resources/strings.dart';
import 'package:test_flutter_app/ui/acti_map/acti_map.dart';
import 'package:test_flutter_app/ui/acti_second/second_view.dart';

class MainView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: Strings.main_text);
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(children: getCardList(Strings.list)),
      floatingActionButton: FloatingActionButton(
        onPressed: toNextScreen,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> getCardList(List<String> list) {
    var widgets = List<Widget>();
    for (int index = 0; index < list.length; index++) {
      widgets.add(createNewCard(index));
    }
    return widgets;
  }

  Widget createNewCard(int index) {
    final TextStyle textStyle = TextStyle(fontSize: 22.0);
    return GestureDetector(
        onTap: () async {
//          onItemClicked(index);
//          Navigator.of(context)
//              .pushNamed(Navigations.to_second_view + );
          var textToSend = "$index";
          var viewResult = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondView(text: textToSend),
              ));

          setState(() {
            print("Returned from SecondView: $viewResult");
          });
        },
        child: Card(
            child: Column(
          children: <Widget>[
            ListTile(title: Text("Element $index", style: textStyle))
          ],
        )));
  }

  void toNextScreen() {
//    Future<Object> returned =
//        Navigator.of(context).pushNamed(Navigations.to_second_view);
//    print("Возвращенное значение: $returned");

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OfflineMap(),
        ));
  }
}
