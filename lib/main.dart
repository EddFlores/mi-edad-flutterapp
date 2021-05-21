import 'package:flutter/material.dart';
import 'package:mi_edad/src/pages/principal_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Edad',
      home: PrincipalPage(),
    );
  }
}
