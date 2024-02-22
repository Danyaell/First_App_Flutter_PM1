import 'package:flutter/material.dart';
import 'package:sumador/views/login.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'navi.dart';
import 'views/test.dart';

class MiPrimeraAPP extends StatelessWidget {
  const MiPrimeraAPP({super.key});
  static var isLoggedIn = true;

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TítuloApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
        ),
        useMaterial3: true,
      ),
      home: const Navi() //SharedPreferencesDemo()
    );
  }
}
