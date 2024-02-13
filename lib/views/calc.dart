import "package:flutter/material.dart";

class Calculadora extends StatefulWidget {
  const Calculadora({super.key, required this.titulo});
  final String titulo;

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  double _trab = 0;

  void _presionarNumero(int n) {
    setState(() {
      _trab=_trab*10+n;
    });
    print(_trab);
  }

  void _borrarTodo() {
    setState(() {
      _trab=0;
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
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 236, 236),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: Colors.black,
                          width: 2
                        )),
                    height: 60,
                    width: 224,
                    child: Text(
                      "$_trab",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Container(
                    height: 280,
                    width: 224,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {_borrarTodo();},
                                child: const Text(
                                  "CE",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                child: const Text(
                                  "C",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                child: const Text(
                                  "%",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                child: const Text(
                                  "/",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  _presionarNumero(1);
                                },
                                child: const Text(
                                  "1",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {_presionarNumero(2);},
                                child: const Text(
                                  "2",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {_presionarNumero(3);},
                                child: const Text(
                                  "3",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                child: const Text(
                                  "*",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {_presionarNumero(4);},
                                child: const Text(
                                  "4",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {_presionarNumero(5);},
                                child: const Text(
                                  "5",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {_presionarNumero(6);},
                                child: const Text(
                                  "6",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                child: const Text(
                                  "-",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {_presionarNumero(7);},
                                child: const Text(
                                  "7",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {_presionarNumero(8);},
                                child: const Text(
                                  "8",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {_presionarNumero(9);},
                                child: const Text(
                                  "9",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                child: const Text(
                                  "+",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {},
                                child: const Text(
                                  ".",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {_presionarNumero(0);},
                                child: const Text(
                                  "0",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                child: const Text(
                                  "=",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                child: const Text(
                                  "^",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ],
                          )
                        ]),
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
