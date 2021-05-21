import 'package:flutter/material.dart';
import 'package:mi_edad/src/widgets/textfield_fecha_widget.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
              'Cambiar fecha para el cálculo (fecha de hoy por default):',
              style: TextStyle(fontSize: 18.0)),
        ),
        FechaWidget(),
        _botonCambiarFecha(),
      ],
    );
  }

  Widget _botonCambiarFecha() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Cambiar',
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
    );
  }
}
