import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/app.dart';

const String supabaseUrl = 'https://ygnthzyelqocrwcrexka.supabase.co';
const String supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlnbnRoenllbHFvY3J3Y3JleGthIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODU0MTkzOTAsImV4cCI6MjAwMDk5NTM5MH0.ik-kCxn82ASqLsWC7kwiJYouH0gc8NPQFvapGcmFauU';

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(MyApp());
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;
const snackbar = SnackBar(
  content: Text('Error: No se pudo realizar la accion. Revise su conexion a internet!', textAlign: TextAlign.center,),
  backgroundColor: Colors.red,
  duration: Duration(seconds: 2),
);