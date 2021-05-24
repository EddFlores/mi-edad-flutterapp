import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mi_edad/src/functions/calcular_funcion.dart';
import 'package:mi_edad/src/widgets/textfield_fecha_widget.dart';
import 'package:mi_edad/src/library/fecha_library.dart' as fecha;

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool _selected = false;
  ScrollController _scrollController = new ScrollController();

  // Obtiene la fecha de hoy
  String fechaHoy = new DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    //Convierte "fechaHoy" a variables (global fecha) enteras
    fecha.anio = int.parse(fechaHoy.substring(0, 4));
    fecha.mes = int.parse(fechaHoy.substring(5, 7));
    fecha.dia = int.parse(fechaHoy.substring(8, 10));

    // Datos de prueba:
    fecha.miAnio = 1989;
    fecha.miMes = 11;
    fecha.miDia = 11;

    return ListView(
      controller: _scrollController,
      children: [
        Column(
          children: [
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  label: Text('${fecha.dia}/${fecha.mes}/${fecha.anio}'),
                  backgroundColor: Colors.black54,
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => alertaCambiarFecha(context),
                ),
                SizedBox(width: 10.0),
              ],
            ),
            SizedBox(height: 10.0),
            // Card de Fecha
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Text(
                      '( Nací el... )',
                      style: TextStyle(fontSize: 40.0, fontFamily: 'Milla'),
                    ),
                    FechaWidget(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0),
            _boton(),
            SizedBox(height: 150.0),
          ],
        ),
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
          if (!_selected) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 500),
            );
          } else {
            _scrollController.animateTo(
              _scrollController.position.minScrollExtent,
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 500),
            );
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
                height: 200.0,
              ),
              Column(
                children: [
                  SizedBox(height: 35.0),
                  Text(
                    calcularEdad(), // Llama a la función calcularEdad
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
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Cambiar fecha para el cálculo [fecha de hoy por default]:',
                style: TextStyle(fontSize: 16.0),
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
