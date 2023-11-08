import 'package:flutter/material.dart';
import 'package:sicahapp_v2/editperfil.dart';
import 'horas.dart';
import 'notificaciones.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Fransisco Lopez Briones',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'franlop25@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Tlaxcala,Hamantla',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '241-129-78-45',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'NO. Trabajador: 115',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '01/01/1990',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'ING. Desarrollo de Software',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      currentName:
                          'Fransisco Lopez Briones', // Cambia esto a los valores reales del perfil
                      currentEmail:
                          'franlop25@gmail.com', // Cambia esto a los valores reales del perfil
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(4.0),
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.all(16)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Editar Perfil'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HorasPage()),
                  );
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(16)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.schedule, color: Colors.white),
                    SizedBox(width: 20),
                    Text('Ir a Horas'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => NotificacionesPage()),
                  );
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(16)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications, color: Colors.white),
                    SizedBox(width: 8),
                    Text('Ir a Notificaciones'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
