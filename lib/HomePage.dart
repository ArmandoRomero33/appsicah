import 'package:flutter/material.dart';
import 'perfil.dart';
import 'horas.dart';
import 'notificaciones.dart';
import 'edicion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
      theme: ThemeData(
        primaryColor: Colors
            .deepPurple, // Cambiar el color de la barra superior (AppBar) a morado
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido!'),
        backgroundColor:
            Colors.deepPurple, // Cambiar el color de la barra superior a morado
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildGridItem(
            context,
            'Perfil',
            Icons.person,
            Colors.deepPurple, // Cambiar el color del ícono a morado
            PerfilPage(),
          ),
          _buildGridItem(
            context,
            'Horas',
            Icons.access_time,
            Colors.green,
            HorasPage(),
          ),
          _buildGridItem(
            context,
            'Notificaciones',
            Icons.notifications,
            Colors.red,
            NotificacionesPage(),
          ),
          _buildGridItem(
            context,
            'Editar Perfil',
            Icons.edit,
            Colors.orange,
            EditarPerfilPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget page,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(
                  0.5), // Cambiar el color de la sombra al color de fondo
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
