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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 580.0,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Boton flotante Fecha
          Positioned(
            top: 10.0,
            right: 0.0,
            child: _botonFechaFlotante(),
          ),
          // Card de Fecha
          Positioned(
            top: 70.0,
            child: _tarjetaPrincipal(),
          ),
          // Botón principal
          _boton(),
        ],
      ),
    );
  }

  void _mostrarAlerta() {
    fecha.switchInputFecha = true;
    alertaCambiarFecha(context);
  }

  // Botón principal
  Widget _boton() {
    return AnimatedPositioned(
      top: fecha.selected ? 150.0 : 440.0,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      width: fecha.selected ? 300 : 120.0,
      height: fecha.selected ? 250 : 120.0,
      child: GestureDetector(
          onTap: _accionBotonPrincipal,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: fecha.selected
                  ? BorderRadius.circular(10.0)
                  : BorderRadius.circular(100.0),
              color: fecha.selected ? Colors.black87 : Colors.blue,
            ),
            child: _contenidoBoton(),
          )),
    );
  }

  // Acción al hacer tap al botón principal
  void _accionBotonPrincipal() {
    _quitarFoco();

    // Si el botón está circular
    if (!fecha.selected) {
      fecha.eneabledTextFields = false;
    } else {
      fecha.miDia = 0;
      fecha.miMes = 0;
      fecha.miAnio = 0;
      fecha.eneabledTextFields = true;
    }
    setState(() {
      fecha.selected = !fecha.selected;
    });
  }

  // Cambia el contenido del botón principal de acuerdo a la acción
  Widget _contenidoBoton() {
    if (fecha.selected) {
      return Container(
        //   child:
        // SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('assets/gifs/fondo.gif'),
              height: 240.0,
            ),
            Text(
              calcularEdad(), // Llama a la función calcularEdad
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 35.0, fontFamily: 'Milla'),
            ),
          ],
        ),
        // ),
      );
    } else {
      return Container(
        color: Colors.transparent,
        child: Image(
          image: AssetImage('assets/gifs/birthday-transparent.gif'),
        ),
      );
    }
  }

  Widget _botonFechaFlotante() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton.extended(
          label: Text('${fecha.dia}/${fecha.mes}/${fecha.anio}'),
          backgroundColor: Colors.black54,
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            fecha.selected = false;
            fecha.eneabledTextFields = true;
            _quitarFoco();
            // if (fecha.eneabledTextFields) {
            _mostrarAlerta();
            // }
          },
        ),
        SizedBox(width: 10.0),
      ],
    );
  }

  Widget _tarjetaPrincipal() {
    return Container(
      width: 370.0, // Tamaño máximo
      height: 360.0, // Alto
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Card(
        // color: Colors.white,
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
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
    );
  }

  // Funcion quitar foco
  void _quitarFoco() {
    final FocusScopeNode focus = FocusScope.of(context);
    if (!focus.hasPrimaryFocus && focus.hasFocus) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}

//Interfaz de Cambiar Fecha
void alertaCambiarFecha(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        content: SingleChildScrollView(
          child: Container(
            width: 300.0, // Tamaño máximo
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Puedes cambiar la fecha para el cálculo [fecha de hoy por defecto]:',
                  style: TextStyle(fontSize: 16.0),
                ),
                FechaWidget(h: 40.0, v: 20.0),
              ],
            ),
          ),
        ),
        // BOTONES
        actions: [
          TextButton(
            onPressed: () {
              fecha.diaProvisional = 0;
              fecha.mesProvisional = 0;
              fecha.anioProvisional = 0;
              fecha.switchInputFecha = false;
              fecha.anio = fecha.anioFinal;
              fecha.mes = fecha.mesFinal;
              fecha.dia = fecha.diaFinal;
              Navigator.of(context).pop();
            },
            child: Text("Resetear"),
          ),
          SizedBox(width: 10.0),
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              fecha.switchInputFecha = false;
              fecha.diaProvisional = 0;
              fecha.mesProvisional = 0;
              fecha.anioProvisional = 0;
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              fecha.switchInputFecha = false;
              if (fecha.diaProvisional > 0 &&
                  fecha.diaProvisional < 32 &&
                  fecha.mesProvisional < 13 &&
                  fecha.mesProvisional > 0 &&
                  fecha.anioProvisional > 1000) {
                fecha.dia = fecha.diaProvisional;
                fecha.mes = fecha.mesProvisional;
                fecha.anio = fecha.anioProvisional;
              }
              fecha.diaProvisional = 0;
              fecha.mesProvisional = 0;
              fecha.anioProvisional = 0;
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
