import "package:flutter/material.dart";

class imagenClickeable extends StatefulWidget {
  const imagenClickeable(
      {super.key,
      this.title = '',
      required this.alto,
      required this.ancho,
      required this.ruta,
      required this.accion});
  final String title;
  final double alto;
  final double ancho;
  final String ruta;
  final VoidCallback accion;

  @override
  State<imagenClickeable> createState() => _imagenClickeableState();
}

class _imagenClickeableState extends State<imagenClickeable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.alto,
        width: widget.ancho,
        child: MaterialButton(
          onPressed: widget.accion,
          child: Image.asset(widget.ruta),
        ));
  }
}
