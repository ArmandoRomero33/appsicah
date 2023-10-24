import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
        backgroundColor: Colors
            .deepPurple, // Cambiar el color de la barra superior a Deep Purple
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                'assets/profile_image.jpg', // Agrega la imagen de perfil
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nombre de Usuario',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'correo@example.com',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10), // Espacio adicional
            Text(
              'Ubicación: Ciudad, País',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10), // Espacio adicional
            Text(
              'Teléfono: (123) 456-7890',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción para editar el perfil
              },
              child: Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
