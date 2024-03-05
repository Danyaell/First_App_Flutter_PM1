import "package:flutter/material.dart";
import "package:syncfusion_flutter_calendar/calendar.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class Calendar extends StatefulWidget {
  const Calendar({super.key, required this.titulo});
  final String titulo;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final db = FirebaseFirestore.instance;
  late List<Meeting> meetings = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    List<Meeting> m = [];
    await db.collection("calendar").get().then((documents) {
      for (var doc in documents.docs) {
        final datos = doc.data();
        final nombre = datos["Nombre"];
        final inicio = (datos["Inicio"] as Timestamp).toDate();
        final fin = (datos["Fin"] as Timestamp).toDate();
        final color = Color(datos["Color"]);
        m.add(Meeting(nombre, inicio, fin, color, false));
      }
    });
    setState(() {
      meetings = m;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SfCalendar(
        dataSource: MeetingDataSource(meetings),
        view: CalendarView.month,
        monthViewSettings: MonthViewSettings(showAgenda: true),
      ),
    ));
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
