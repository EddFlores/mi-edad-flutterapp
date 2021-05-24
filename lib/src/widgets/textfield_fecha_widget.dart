import 'package:flutter/material.dart';
import 'package:mi_edad/src/library/fecha_library.dart' as fecha;

class FechaWidget extends StatelessWidget {
  const FechaWidget({
    double this.h = 70.0,
    double this.v = 30.0,
  });

  final h;
  final v;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerDia = TextEditingController(text: '');
    final TextEditingController controllerMes = TextEditingController(text: '');
    final TextEditingController controllerAnio =
        TextEditingController(text: '');

    return Container(
      padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
      child: Column(
        children: [
          // Día
          TextField(
            enabled: fecha.eneabledTextFields,
            textInputAction: TextInputAction.unspecified,
            autofocus: false,
            controller: controllerDia,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Día',
              hintText: fecha.switchInputFecha ? '${fecha.dia}' : '21',
            ),
            // Función cuando cambia un valor en el TextFueld Día
            onChanged: (value) {
              // Caso TextField principal
              if (!fecha.switchInputFecha) {
                if (int.tryParse(value) == null) {
                  fecha.miDia = 0;
                } else {
                  fecha.miDia = int.parse(value);
                }
                print('Dia provisional: ${fecha.diaProvisional}');
              }
            },
          ),
          SizedBox(height: 30.0),
          // Mes
          TextField(
            enabled: fecha.eneabledTextFields,
            textInputAction: TextInputAction.unspecified,
            autofocus: false,
            controller: controllerMes,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mes',
              hintText: fecha.switchInputFecha ? '${fecha.mes}' : '12',
            ),
            // Función cuando cambia un valor en el TextFueld Mes
            onChanged: (value) {
              // Caso TextField principal
              if (!fecha.switchInputFecha) {
                if (int.tryParse(value) == null) {
                  fecha.miMes = 0;
                } else {
                  fecha.miMes = int.parse(value);
                }
                print('Mes provisional: ${fecha.mesProvisional}');
              }
            },
          ),
          SizedBox(height: 30.0),
          // Año
          TextField(
            enabled: fecha.eneabledTextFields,
            textInputAction: TextInputAction.unspecified,
            autofocus: false,
            controller: controllerAnio,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Año',
              hintText: fecha.switchInputFecha ? '${fecha.anio}' : '2020',
            ),
            // Función cuando cambia un valor en el TextFueld Año
            onChanged: (value) {
              // TextField principal
              if (!fecha.switchInputFecha) {
                if (int.tryParse(value) == null) {
                  fecha.miAnio = 0;
                } else {
                  fecha.miAnio = int.parse(value);
                }
                print('Año provisional: ${fecha.anioProvisional}');
              }
            },
          ),
        ],
      ),
    );
  }
}
