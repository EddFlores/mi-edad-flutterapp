import 'package:flutter/material.dart';
import 'package:mi_edad/src/pages/page1.dart';

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi edad'),
      ),
      body: Page1(),
    );
  }
}
