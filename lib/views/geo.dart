import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";

class Geo extends StatefulWidget {
  const Geo({super.key, required this.titulo});
  final String titulo;

  @override
  State<Geo> createState() => _GeoState();
}

class _GeoState extends State<Geo> {
  String _lat = "";
  String _long = "";
  late Position _location;

  Future<Position> _getLocation() async {
    bool availableService;
    LocationPermission permission;

    availableService = await Geolocator.isLocationServiceEnabled();
    if (!availableService) {
      return Future.error("Los servicios de ubicación están deshabilitados. >:()");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Los servicios de ubicación están deshabilitados. >:()");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Los servicios de ubicación están deshabilitados para SIEMPREEE. >:()");
    }

    return Geolocator.getCurrentPosition();
  }

  void _pressedButton () async {
    _location = await _getLocation();
    setState(() {
      _lat = _location.latitude.toString();
      _long = _location.longitude.toString();
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
            children: [
              Text(
                "Latitud: $_lat",
                style: const TextStyle(fontSize: 35),
              ),
              Text(
                "Longitud: $_long",
                style: const TextStyle(fontSize: 35),
              ),
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                  onPressed: () {_pressedButton();},
                  child: const Text("Obtener ubicación",
                      style: TextStyle(fontSize: 35, backgroundColor: Color.fromARGB(255, 114, 183, 217))))
            ],
          ),
        ));
  }
}
