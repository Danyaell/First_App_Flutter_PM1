import "package:flutter/material.dart";

class Doritos extends StatefulWidget {
  const Doritos({super.key, required this.titulo});
  final String titulo;

  @override
  State<Doritos> createState() => _DoritosState();
}

class _DoritosState extends State<Doritos> {
  int _counter = -5;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
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
          children: <Widget>[
            const Text(
              'Victorias en el LoL:',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _incrementCounter,
            backgroundColor: Colors.amber,
            tooltip: 'Incrementar en 1',
            child: const Icon(Icons.plus_one_outlined),
          ),
          const SizedBox(
            height: 20,
            width: 10,
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            backgroundColor: Colors.amberAccent,
            tooltip: 'Decrementar en 1',
            child: const Icon(Icons.exposure_minus_1_outlined),
          ),
        ],
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}