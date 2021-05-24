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
  // bool fecha.selected = false;
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
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
                  onPressed: fecha.eneabledTextFields ? _mostrarAlerta : null,
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
            SizedBox(height: 20.0),
            _boton(),
            SizedBox(height: 150.0),
          ],
        ),
      ],
    );
  }

  void _mostrarAlerta() {
    fecha.switchInputFecha = true;
    alertaCambiarFecha(context);
  }

  // Botón principal
  Widget _boton() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: GestureDetector(
        onTap: _accionBotonPrincipal,
        child: _contenidoBoton(),
      ),
      width: fecha.selected ? 300 : 120.0,
      height: fecha.selected ? 200 : 120.0,
      decoration: BoxDecoration(
        borderRadius: fecha.selected
            ? BorderRadius.circular(10.0)
            : BorderRadius.circular(100.0),
        color: fecha.selected ? Colors.black87 : Colors.blue,
      ),
    );
  }

  // Acción al hacer tap al botón principal
  void _accionBotonPrincipal() {
    final FocusScopeNode focus = FocusScope.of(context);
    if (!focus.hasPrimaryFocus && focus.hasFocus) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
    fecha.switchInputFecha = false;
    // Si el botón está circular
    if (!fecha.selected) {
      fecha.eneabledTextFields = false;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 500),
      );
      // Si el botón tiene el resultado
    } else {
      fecha.miDia = 0;
      fecha.miMes = 0;
      fecha.miAnio = 0;
      fecha.eneabledTextFields = true;
      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 500),
      );
    }
    setState(() {
      fecha.selected = !fecha.selected;
    });
  }

  // Cambia el contenido del botón principal de acuerdo a la acción
  Widget _contenidoBoton() {
    if (fecha.selected) {
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
                  SizedBox(height: 25.0),
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
                'Cambiar fecha para el cálculo [fecha de hoy por defecto]:',
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
