import 'package:flutter/material.dart';

class NotificacionesPage extends StatefulWidget {
  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  List<String> notificaciones = ["", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: notificaciones.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notificaciones[index]),
            onTap: () {
              // Navegar a la pantalla de detalles de la notificación
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificacionDetallePage(
                    notificacion: notificaciones[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class NotificacionDetallePage extends StatelessWidget {
  final String notificacion;

  NotificacionDetallePage({required this.notificacion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Notificación'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Detalles de la Notificación',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              notificacion,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
