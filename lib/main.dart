import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_edad/src/pages/principal_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Edad',
      home: PrincipalPage(),
      // theme: ThemeData.dark(),
    );
  }
}
