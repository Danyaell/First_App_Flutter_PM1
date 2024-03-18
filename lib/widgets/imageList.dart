import "package:flutter/material.dart";

class imageList extends StatefulWidget {
  const imageList(
      {super.key,
      this.title = '',
      required this.routes,
      required this.descriptions});
  final String title;
  final List<String> routes;
  final List<String> descriptions;

  @override
  State<imageList> createState() => _imageListState();
}

class _imageListState extends State<imageList> {
  @override
  void initState() {
    super.initState();
  }

  renderImages(listRoutes, listDescriptions) {
    final listsLength = listRoutes.length;
    List<Widget> images = [];
    for (var item = 0; item <= listsLength-1; item++) {
      images.add(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(
          width: 300,
          child: Image.asset(listRoutes[item]),
        ),
        SizedBox(
          width: 300,
          child: Text(listDescriptions[item], textAlign: TextAlign.center,),
        )
      ],));
    }

    return images;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: renderImages(widget.routes, widget.descriptions),
    );
  }
}
