// ALGORITMO CON VARIABLES GLOBALES

import 'package:mi_edad/src/library/fecha_library.dart' as fecha;

String calcularEdad() {
  int anioCalculado = 0;
  int mesCalculado = 0;
  int diaCalculado = 0;

  anioCalculado = fecha.anio - fecha.miAnio;

  if (fecha.miDia < 1 ||
      fecha.miDia > 31 ||
      fecha.miMes > 12 ||
      fecha.miMes < 1 ||
      fecha.miAnio > fecha.anio ||
      anioCalculado < 0) {
    return 'Oooops!\n\nDatos no válidos';
  }

  if ((fecha.dia == fecha.miDia) && (fecha.mes == fecha.miMes)) {
    mesCalculado = 0;
    diaCalculado = 0;
  } else if ((fecha.mes >= fecha.miMes) && (fecha.dia > fecha.miDia)) {
    mesCalculado = fecha.mes - fecha.miMes;
    diaCalculado = fecha.dia - fecha.miDia;
  } else if ((fecha.mes > fecha.miMes) && (fecha.dia < fecha.miDia)) {
    mesCalculado = fecha.mes - fecha.miMes - 1;
    diaCalculado = 30 + fecha.dia - fecha.miDia;
  } else if ((fecha.mes > fecha.miMes) && (fecha.dia == fecha.miDia)) {
    mesCalculado = fecha.mes - fecha.miMes;
    diaCalculado = 0;
  } else if ((fecha.mes == fecha.miMes) && (fecha.dia < fecha.miDia)) {
    anioCalculado--;
    mesCalculado = 11;
    diaCalculado = 30 + fecha.dia - fecha.miDia;
  } else if ((fecha.mes < fecha.miMes) && (fecha.dia > fecha.miDia)) {
    anioCalculado--;
    mesCalculado = 12 - fecha.miMes + fecha.mes;
    diaCalculado = fecha.dia - fecha.miDia;
  } else if ((fecha.mes < fecha.miMes) && (fecha.dia == fecha.miDia)) {
    anioCalculado--;
    mesCalculado = 12 - fecha.miMes + fecha.mes;
    diaCalculado = 0;
  } else if ((fecha.mes < fecha.miMes) && (fecha.dia < fecha.miDia)) {
    anioCalculado--;
    mesCalculado = 11 - fecha.miMes + fecha.mes;
    diaCalculado = 30 + fecha.dia - fecha.miDia;
  }

  return '( Tengo )\n\n$anioCalculado años, $mesCalculado meses y $diaCalculado días';
}

/////////////////////////////
// ALGORITMO COMO FUNCIÓN //
///////////////////////////

// String calcularEdad(
//     int miDia, int miMes, int miAnio, int dia, int mes, int anio) {
//   int anioCalculado = 0;
//   int mesCalculado = 0;
//   int diaCalculado = 0;

//   anioCalculado = anio - miAnio;

//   if (miDia < 1 ||
//       miDia > 31 ||
//       miMes > 12 ||
//       miMes < 1 ||
//       miAnio > anio ||
//       anioCalculado < 0) {
//     return 'Oooops!\n\nDatos no válidos';
//   }

//   if ((dia == miDia) && (mes == miMes)) {
//     mesCalculado = 0;
//     diaCalculado = 0;
//   } else if ((mes >= miMes) && (dia > miDia)) {
//     mesCalculado = mes - miMes;
//     diaCalculado = dia - miDia;
//   } else if ((mes > miMes) && (dia < miDia)) {
//     mesCalculado = mes - miMes - 1;
//     diaCalculado = 30 + dia - miDia;
//   } else if ((mes > miMes) && (dia == miDia)) {
//     mesCalculado = mes - miMes;
//     diaCalculado = 0;
//   } else if ((mes == miMes) && (dia < miDia)) {
//     anioCalculado--;
//     mesCalculado = 11;
//     diaCalculado = 30 + dia - miDia;
//   } else if ((mes < miMes) && (dia > miDia)) {
//     anioCalculado--;
//     mesCalculado = 12 - miMes + mes;
//     diaCalculado = dia - miDia;
//   } else if ((mes < miMes) && (dia == miDia)) {
//     anioCalculado--;
//     mesCalculado = 12 - miMes + mes;
//     diaCalculado = 0;
//   } else if ((mes < miMes) && (dia < miDia)) {
//     anioCalculado--;
//     mesCalculado = 11 - miMes + mes;
//     diaCalculado = 30 + dia - miDia;
//   }

//   return '( Tengo )\n\n$anioCalculado años, $mesCalculado meses y $diaCalculado dias';
// }
