import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:mi_edad/src/pages/principal_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((_) {
  //   runApp(new MyApp());
  // });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Edad',
      home: PrincipalPage(),
    );
  }
}
