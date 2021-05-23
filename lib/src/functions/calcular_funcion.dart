String calcularEdad(
    int miDia, int miMes, int miAnio, int dia, int mes, int anio) {
  int anioCalculado = 0;
  int mesCalculado = 0;
  int diaCalculado = 0;

  // String fechaHoy = new DateTime.now().toString();

  // //Convierte la fechaHoy a variables enteras
  // int anio = int.parse(fechaHoy.substring(0, 4));
  // int mes = int.parse(fechaHoy.substring(5, 7));
  // int dia = int.parse(fechaHoy.substring(8, 10));

  anioCalculado = anio - miAnio;

  if (miDia < 1 ||
      miDia > 31 ||
      miMes > 12 ||
      miMes < 1 ||
      miAnio > anio ||
      anioCalculado < 0) {
    return 'Oooops!\n\nDatos no válidos';
  }

  if ((dia == miDia) && (mes == miMes)) {
    mesCalculado = 0;
    diaCalculado = 0;
  } else if ((mes >= miMes) && (dia > miDia)) {
    mesCalculado = mes - miMes;
    diaCalculado = dia - miDia;
  } else if ((mes > miMes) && (dia < miDia)) {
    mesCalculado = mes - miMes - 1;
    diaCalculado = 30 + dia - miDia;
  } else if ((mes > miMes) && (dia == miDia)) {
    mesCalculado = mes - miMes;
    diaCalculado = 0;
  } else if ((mes == miMes) && (dia < miDia)) {
    anioCalculado--;
    mesCalculado = 11;
    diaCalculado = 30 + dia - miDia;
  } else if ((mes < miMes) && (dia > miDia)) {
    anioCalculado--;
    mesCalculado = 12 - miMes + mes;
    diaCalculado = dia - miDia;
  } else if ((mes < miMes) && (dia == miDia)) {
    anioCalculado--;
    mesCalculado = 12 - miMes + mes;
    diaCalculado = 0;
  } else if ((mes < miMes) && (dia < miDia)) {
    anioCalculado--;
    mesCalculado = 11 - miMes + mes;
    diaCalculado = 30 + dia - miDia;
  }

  print(
      '( Tengo )\n\n$anioCalculado años, $mesCalculado meses y $diaCalculado dias');

  return '( Tengo )\n\n$anioCalculado años, $mesCalculado meses y $diaCalculado dias';
}
