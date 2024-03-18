import "package:flutter/material.dart";
import "package:sumador/widgets/imageList.dart";
import "package:sumador/widgets/imagenClickeable.dart";

class Album extends StatefulWidget {
  const Album({super.key, required this.title});
  final String title;

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  @override
  void initState() {
    super.initState();
  }

  void clickBluey() {
    print('Se clickeo a Bluey.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const imageList(
          routes: ['bluey/bluey.png', 'bluey/aerith.png'],
          descriptions: ['un bluey jsjs', 'una aerith bonita chula']),

      /* ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            imagenClickeable(
              //networkImage: false,
              alto: 400,
              ancho: 400,
              ruta: "bluey/bluey.png",
              accion: () => print('Se presionó a Bluey.'),
            ),
            SizedBox(
              height: 500,
              child: MaterialButton(
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/en/2/2f/Aerith_Gainsborough.png'),
                onPressed: () => print('Oal Chavo B)'),
              )
            ),
          ])
        ]) */
    );
  }
}
