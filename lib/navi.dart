import "package:flutter/material.dart";
import "package:sumador/views/calc.dart";
import "package:sumador/views/doritos.dart";
import "package:sumador/views/login.dart";
import "package:sumador/views/geo.dart";
import "package:sumador/views/welcome.dart";

class Navi extends StatefulWidget {
  const Navi({super.key});

  @override
  State<Navi> createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  int _indice = 0;
  final _cuerpo = [
    const Welcome(
      titulo: "Bienvenido"
    ),
    const Calculadora(
      titulo: "Calculadora",
    ),
    const Doritos(
      titulo: "Contador",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _cuerpo.add(
    Login(
      titulo: "Login", 
      home: _home,
      ),
    );

    _cuerpo.add(
    const Geo(
      titulo: "Geo", 
      ),
    );
  }

  void _home (int n) {
    setState(() {
      _indice = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cuerpo[_indice],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indice,
        onTap: (value) {
          setState(() {
          _indice = value;
          });
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: "Home",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.calculate),
        label: "Calculadora",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.add),
        label: "Contador",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.login),
        label: "Login",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.local_activity),
        label: "Geo",
        ),
      ]),
    );
  }
}
