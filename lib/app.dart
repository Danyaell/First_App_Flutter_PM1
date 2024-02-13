import 'package:flutter/material.dart';
import 'package:sumador/views/calc.dart';
import 'views/doritos.dart';

class MiPrimeraAPP extends StatelessWidget {
  const MiPrimeraAPP({super.key});

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
      home: const Calculadora(
        titulo: "Programando Mi APP",
      ),
    );
  }
}
