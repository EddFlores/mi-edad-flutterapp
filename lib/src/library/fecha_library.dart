library mi_edad.fecha;

// Obtiene la fecha de hoy
String _fechaHoy = new DateTime.now().toString();

//Convierte "fechaHoy" a variables (global fecha) enteras
int anio = int.parse(_fechaHoy.substring(0, 4));
int mes = int.parse(_fechaHoy.substring(5, 7));
int dia = int.parse(_fechaHoy.substring(8, 10));

final int anioFinal = int.parse(_fechaHoy.substring(0, 4));
final int mesFinal = int.parse(_fechaHoy.substring(5, 7));
final int diaFinal = int.parse(_fechaHoy.substring(8, 10));

int miDia = 0;
int miMes = 0;
int miAnio = 0;
int diaProvisional = 0;
int mesProvisional = 0;
int anioProvisional = 0;
bool switchInputFecha = false;
bool selected = false;
bool eneabledTextFields = true;
