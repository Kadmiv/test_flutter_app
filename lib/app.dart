import 'package:flutter/material.dart';
import 'package:test_flutter_app/ui/acti_main/main_view.dart';
import 'package:test_flutter_app/ui/acti_second/second_view.dart';
import 'package:test_flutter_app/ui/acti_splash/splash_view.dart';

void main() {

  runApp(MaterialApp(initialRoute: '/', routes: appRoutes
//    onGenerateRoute: (routeSettings) {
//      var path = routeSettings.name.split('/');
//
//      if (Navigations.to_second_view.contains(path[1])) {
//        return MaterialPageRoute(
//          builder: (context) => SecondView(text: path[2]),
//          settings: routeSettings,
//        );
//      }
//    },
      ));

//  var bob = Employee("Bob", "Google");
//  bob.display(); // Name: Bob
//  bob.work(); // Works in Google
}


final appRoutes = {
  '/': (BuildContext context) => SplashScreen(mainViewPath: "/main"),
  '/main': (BuildContext context) => MainView(),
  '/second': (BuildContext context) => SecondView()
};



/*
Пример activityForResult
Map coordinates = await Navigator.of(context).pushNamed('/location');
Navigator.of(context).pop({"lat":43.821757,"long":-79.226392});
 */

/*
Выполнение запроса и возврата результата для обновления UI:
loadData() async {
  String dataURL = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(dataURL);
  setState(() {
    widgets = json.decode(response.body);
  });
}
Когда ответ на запрос получен, нужно вызвать метод setState() для перерисовки дерева виджетов с новыми данными.
 */

/*
Recycler View sample
 ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int position) {
            return getRow(position);
          }));
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["title"]}")
    );
  }
 */

/*
Work with SnackBar 

        Scaffold.of(context).showSnackBar(
          SnackBar(content: const Text('Removed task')),
        );
 */