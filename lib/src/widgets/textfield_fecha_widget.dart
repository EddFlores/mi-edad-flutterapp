import 'package:flutter/material.dart';

class FechaWidget extends StatelessWidget {
  const FechaWidget({
    double this.h = 70.0,
    double this.v = 30.0,
  });

  final h;
  final v;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
      child: Column(
        children: [
          // Día
          TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Día',
              hintText: '24',
            ),
          ),
          SizedBox(height: 30.0),
          // Mes
          TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mes',
              hintText: '12',
            ),
          ),
          SizedBox(height: 30.0),
          // Año
          TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Año',
              hintText: '2020',
            ),
          ),
        ],
      ),
    );
  }
}
