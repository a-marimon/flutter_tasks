import 'package:flutter/material.dart';

const String kAppName = 'Flutter Task'; //Nombre de la aplicacion para su uso en donde se requiera mostrar
const double kDefaultPadding = 16.0; // En cuanto a los pading a tener en cuenta en la app es util tener una unica referencia para cambios generales en caso de necesitar - o +
const kPrimaryColor = Colors.yellow; //Seria el color predominante, aqui pueden definirse otra serie de colores prncipales para mejorar la realizacion de los temas de la app y su uso, aunque en material3 , con la integracion del ColorScheme no se hace muy necesaria
const kDeveloperEmail = 'ariancamejo0897@gmail.com'; // en caso de enter varios usos de este email, ya sea para notificar errores u otras situaciones, creo recomendable mantenerlo en caso de necesitar cambiarlo posteriormente solo tendriamos que venir aqui
const String kApiUrl = 'https://acarrera0897.pythonanywhere.com/api'; //Esta viene siendo la url del servidor ((( PARA CONFIGURACIONES DE INFORMACION PRIVADA uso dot_env para almacenar las claves como ApiKey  en el .env  )))
//Defini este parametro ya que dado este la app es capaz de tener multiples paginas de contadores dinamicamente segun se defiann aqui
const List<dynamic> nameCounters = [
  {"name": "A", "color": Colors.red},
  {"name": "B", "color": Colors.blue}
];
//Viene siendo el formato estandar que se pretende usar para mostrar las fechas
const dateFormat = 'dd-MMMM-yyyy hh:mm:ss a';
