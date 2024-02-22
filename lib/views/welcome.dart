import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class Welcome extends StatefulWidget {
  const Welcome({super.key, required this.titulo});
  final String titulo;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _message = "Bienvenida";
  String _name = "";

  Future<void> _getName() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs != Null) {
      setState(() {
        _name = prefs.getString('name') ?? "popo";
        _message = "Bienvenid@, $_name";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _getName();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.titulo),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                _message,
                style: const TextStyle(
                  fontSize: 35
                ),
              ),
            ],
          ),
        ));
  }
}
