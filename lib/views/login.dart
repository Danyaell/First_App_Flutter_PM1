import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class Login extends StatefulWidget {
  const Login({super.key, required this.titulo, required this.home});
  final Function home;
  final String titulo;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _textEditingController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _saveName() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs != Null) {
      prefs.setString('name', _textEditingController.text);
      setState(() {
        _textEditingController.text = "";
      });
    }
  }

  final String _userName = "Danos";
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.titulo),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      onSubmitted: (value) {_saveName(); widget.home(0);},
                      controller: _textEditingController,
                      /* onChanged: (String value) {
                        _userName = value;
                      }, */
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Nombre'),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      _saveName();
                      widget.home(0);
                    },
                    child: const Text("Enviar"),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
