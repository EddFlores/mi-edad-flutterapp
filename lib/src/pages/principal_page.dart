import 'package:flutter/material.dart';
import 'package:mi_edad/src/pages/page1.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  int dia = 11;
  int mes = 11;
  int anio = 1989;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi edad'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(16.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '    Fecha: $dia/$mes/$anio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(child: Page1()),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.grey[700],
        label: Text('Cambiar'),
        icon: Icon(Icons.calendar_today),
        onPressed: () {
          alertaCambiarFecha(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
