import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class AddData extends StatefulWidget {
  const AddData({super.key, required this.titulo});
  final String titulo;

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final TextEditingController _nombreTEC = TextEditingController();
  final TextEditingController _inicioTEC = TextEditingController();
  final TextEditingController _finTEC = TextEditingController();
  final TextEditingController _colorTEC = TextEditingController();
  final db = FirebaseFirestore.instance;
  @override
  void initState(){
    super.initState();
  }

  Future<void> _sendData() async {
    String nombre = _nombreTEC.text;
    Timestamp inicio = Timestamp.fromDate(DateTime.parse(_inicioTEC.text));
    Timestamp fin = Timestamp.fromDate(DateTime.parse(_finTEC.text));
    int color = int.parse(_colorTEC.text);

    Map<String, dynamic> datos = {
      "Nombre":nombre,
      "Inicio":inicio,
      "Fin":fin,
      "Color":color
    };

    print(datos)

    //await db.collection("calendario").add(datos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.titulo),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _nombreTEC,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nombre'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _inicioTEC,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Inicio'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _finTEC,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Fin'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _colorTEC,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Color'),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
