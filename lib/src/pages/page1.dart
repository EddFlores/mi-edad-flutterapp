import 'package:flutter/material.dart';
import 'package:mi_edad/src/widgets/textfield_fecha_widget.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.0),
        Text(
          '( Nací el... )',
          style: TextStyle(fontSize: 40.0, fontFamily: 'Milla'),
        ),
        FechaWidget(),
        _boton(),
      ],
    );
  }

  // Botón principal
  Widget _boton() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
          setState(() {
            _selected = !_selected;
          });
        },
        child: _contenidoBoton(),
      ),
      width: _selected ? 300 : 120.0,
      height: _selected ? 200 : 120.0,
      decoration: BoxDecoration(
        borderRadius: _selected
            ? BorderRadius.circular(10.0)
            : BorderRadius.circular(100.0),
        color: _selected ? Colors.black87 : Colors.blue,
      ),
    );
  }

  // Cambia el contenido del botón principal de acuerdo a la acción
  Widget _contenidoBoton() {
    if (_selected) {
      return Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image(
                image: AssetImage('assets/gifs/fondo.gif'),
              ),
              Column(
                children: [
                  SizedBox(height: 40.0),
                  Text(
                    '( Tengo )\n\n31 años, 10 meses, 19 días',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontFamily: 'Milla'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.transparent,
        child: Image(
          image: AssetImage('assets/gifs/birthday-transparent.gif'),
          // width: 200.0,
        ),
      );
    }
  }
}

//Interfaz de Cambiar Fecha
void alertaCambiarFecha(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        // title: Text('Cambiar fecha'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Cambiar fecha para el cálculo [fecha de hoy por default]:',
                style: TextStyle(
                  fontSize: 16.0,
                  // fontFamily: 'Milla',
                ),
              ),
              FechaWidget(h: 40.0, v: 20.0),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
