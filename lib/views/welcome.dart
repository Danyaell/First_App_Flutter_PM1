import "package:flutter/material.dart";

class Welcome extends StatefulWidget {
  const Welcome({super.key, required this.titulo});
  final String titulo;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final String _userName = "Danos";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.titulo),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Bienvenido, $_userName",
                style: const TextStyle(
                  fontSize: 26
                ),
              ),
            ],
          ),
        ));
  }
}
