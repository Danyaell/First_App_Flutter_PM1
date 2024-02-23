import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class Doritos extends StatefulWidget {
  const Doritos({super.key, required this.titulo});
  final String titulo;

  @override
  State<Doritos> createState() => _DoritosState();
}

class _DoritosState extends State<Doritos> {
  final db = FirebaseFirestore.instance;
  int _counter = -5;

  @override
  void initState() {
    _readData();
  }

  void _writeData() async {
    await db.collection("numeros").doc("n0").set({"contador" : _counter});
  }

  void _readData () async {
    await db.collection("numeros").doc("n0").get().then((documento) {
      setState(() {
        _counter = documento.get("contador");
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _writeData();
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    _writeData();
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