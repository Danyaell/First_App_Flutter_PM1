import "package:flutter/material.dart";

class Login extends StatefulWidget {
  const Login({super.key, required this.titulo});
  final String titulo;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _userName = "Danos";
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
                      onChanged: (String value) {
                        _userName = value;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Nombre'),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Text("Enviar"),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
