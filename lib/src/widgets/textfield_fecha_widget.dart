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
    // Controladores de los TextFields
    final TextEditingController controllerDia = TextEditingController(text: '');
    final TextEditingController controllerMes = TextEditingController(text: '');
    final TextEditingController controllerAnio =
        TextEditingController(text: '');

    return Container(
      padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
      child: Column(
        children: [
          // Día
          _textFieldFecha('Día', fecha.dia, '21', controllerDia),
          SizedBox(height: 30.0),
          // Mes
          _textFieldFecha('Mes', fecha.mes, '12', controllerMes),
          SizedBox(height: 30.0),
          // Año
          _textFieldFecha('Año', fecha.anio, '1999', controllerAnio),
        ],
      ),
    );
  }

  Widget _textFieldFecha(String tipoFecha, int fechaObtenida, String porDefecto,
      TextEditingController controlador) {
    return TextField(
      enabled: fecha.eneabledTextFields,
      textInputAction: TextInputAction.unspecified,
      autofocus: false,
      controller: controlador,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: tipoFecha,
        hintText: fecha.switchInputFecha ? '$fechaObtenida' : porDefecto,
      ),
      // Función cuando cambia un valor en el TextFueld Año, Mes o Día
      onChanged: (value) {
        if (tipoFecha == 'Año') {
          _fechaAnioTextField(value);
        } else if (tipoFecha == 'Mes') {
          _fechaMesTextField(value);
        } else if (tipoFecha == 'Día') {
          _fechaDiaTextField(value);
        }
      },
    );
  }

  void _fechaDiaTextField(String value) {
    // Caso TextField principal
    if (!fecha.switchInputFecha) {
      if (int.tryParse(value) == null) {
        fecha.miDia = 0;
      } else {
        fecha.miDia = int.parse(value);
      }
    } else {
      // Caso TextField cambiar fecha
      if (int.tryParse(value) != null) {
        fecha.diaProvisional = int.parse(value);
      }
    }
  }

  void _fechaMesTextField(String value) {
    // Caso TextField principal
    if (!fecha.switchInputFecha) {
      if (int.tryParse(value) == null) {
        fecha.miMes = 0;
      } else {
        fecha.miMes = int.parse(value);
      }
    } else {
      // Caso TextField cambiar fecha
      if (int.tryParse(value) != null) {
        fecha.mesProvisional = int.parse(value);
      }
    }
  }

  void _fechaAnioTextField(String value) {
    // TextField principal
    if (!fecha.switchInputFecha) {
      if (int.tryParse(value) == null) {
        fecha.miAnio = 0;
      } else {
        fecha.miAnio = int.parse(value);
      }
    } else {
      // Caso TextField cambiar fecha
      if (int.tryParse(value) != null) {
        fecha.anioProvisional = int.parse(value);
      }
    }
  }
}
