import 'package:flutter/material.dart';
import 'package:mi_edad/src/functions/calcular_funcion.dart';
import 'package:mi_edad/src/widgets/textfield_fecha_widget.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool _selected = false;
  int miDia = 11;
  int miMes = 11;
  int miAnio = 1989;
  int dia = 0;
  int mes = 0;
  int anio = 0;

  // Obtiene la fecha de hoy
  String fechaHoy = new DateTime.now().toString();

  // //Convierte la fechaHoy a variables enteras
  // int anio = int.parse(fechaHoy.substring(0, 4));
  // int mes = int.parse(fechaHoy.substring(5, 7));
  // int dia = int.parse(fechaHoy.substring(8, 10));

  @override
  Widget build(BuildContext context) {
    //Convierte la fechaHoy a variables enteras
    anio = int.parse(fechaHoy.substring(0, 4));
    mes = int.parse(fechaHoy.substring(5, 7));
    dia = int.parse(fechaHoy.substring(8, 10));

    return Column(
      children: [
        SizedBox(height: 40.0),
        Text(
          '( Nací el... )',
          style: TextStyle(fontSize: 40.0, fontFamily: 'Milla'),
        ),
        FechaWidget(),
        _boton(),
        SizedBox(height: 40.0),
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
    print('$anio-$mes-$dia');
    print('$miAnio-$miMes-$miDia');
    if (_selected) {
      return Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image(
                image: AssetImage('assets/gifs/fondo.gif'),
                height: 200.0,
              ),
              Column(
                children: [
                  SizedBox(height: 40.0),
                  Text(
                    calcularEdad(miDia, miMes, miAnio, dia, mes,
                        anio), // Llama a la función calcularEdad
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
