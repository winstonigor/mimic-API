import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:splashscreen/splashscreen.dart';
import 'home_screen.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Splash Screen Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        backgroundColor: Colors.orange[400],
        navigateAfterSeconds: HomeScreen(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.scaleDown,
              scale: 1.5),
        ),
        // child: Text(),
      ),
      Container(
          child: Center(
        child: Text(
          "Mimic App",
          style: TextStyle(
              fontSize: (28),
              height: 15,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ))
    ],
  );
}
