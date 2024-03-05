import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class AddData extends StatefulWidget {
  const AddData({super.key, required this.title});
  final String title;

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final TextEditingController _nameInput = TextEditingController();
  final TextEditingController _startDateInput = TextEditingController();
  final TextEditingController _endDateInput = TextEditingController();
  final TextEditingController _colorInput = TextEditingController();
  final db = FirebaseFirestore.instance;

  @override
  void initState(){
    super.initState();
  }

  Future<void> _sendData() async {
    String name = _nameInput.text;
    Timestamp startDate = Timestamp.fromDate(DateTime.parse(_startDateInput.text));
    Timestamp endDate = Timestamp.fromDate(DateTime.parse(_endDateInput.text));
    int color = int.parse(_colorInput.text);
    //2024-03-05 10:00:00.000
    //print(Color(0xFFA30186));

    Map<String, dynamic> datos = {
      "Nombre":name,
      "Inicio":startDate,
      "Fin":endDate,
      "Color":color
    };

    await db.collection("calendar").add(datos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
                    controller: _nameInput,
                    decoration: const InputDecoration(
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
                    controller: _startDateInput,
                    decoration: const InputDecoration(
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
                    controller: _endDateInput,
                    decoration: const InputDecoration(
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
                    controller: _colorInput,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Color'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                    onPressed: () {
                      _sendData();
                    },
                    child: const Text("Enviar"),
                  ),
              ],
            )
          ]),
        ));
  }
}
