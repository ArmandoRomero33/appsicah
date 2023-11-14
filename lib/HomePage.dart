import 'package:flutter/material.dart';
import 'editperfil.dart';
import 'horas.dart';
import 'notificaciones.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  final String profileImageUrl =
      'https://avatars.githubusercontent.com/u/39685222?s=48&v=4';

  String nombre = 'Francisco Lopez Briones';
  String email = 'franlop25@gmail.com';
  String telefono = '241-587-46-97';
  String titulo = 'Ingenieria';
  String especialidad = 'TICs';
  String ciudad = 'Huamantla';
  String nacimineto = '15/02/1995';
  String carrera = 'ING sistemas';

  // Define un ButtonStyle personalizado con diferentes estilos
  final customButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.green),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    padding: MaterialStateProperty.all(EdgeInsets.all(16)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    )),
    textStyle: MaterialStateProperty.all(
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UTT',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(widget.profileImageUrl),
            ),
            SizedBox(height: 20),
            Text(
              widget.nombre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Correo electrónico: ${widget.email}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Titulo Academico: ${widget.titulo}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Especialidad: ${widget.especialidad}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Telefono: ${widget.telefono}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      currentName: widget.nombre,
                      currentEmail: widget.email,
                      currentTitulo: widget.titulo,
                      currentEspecialidad: widget.especialidad,
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {
                    widget.nombre = result['name'];
                    widget.email = result['email'];
                    widget.especialidad = result['especialidad'];
                  });
                }
              },
              style: widget
                  .customButtonStyle, // Aplica el ButtonStyle personalizado
              child: const Row(
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time,
                color: Colors.white), // Icono en color blanco
            label: 'Horas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,
                color: Colors.white), // Icono en color blanco
            label: 'Notificaciones',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HorasPage()));
          } else if (index == 1) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NotificacionesPage()));
          }
        },
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final String currentName;
  final String currentEmail;
  final String currentTitulo;
  final String currentEspecialidad;

  EditProfilePage({
    required this.currentName,
    required this.currentEmail,
    required this.currentTitulo,
    required this.currentEspecialidad,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tituloController = TextEditingController();
  TextEditingController especialidadController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.currentName;
    emailController.text = widget.currentEmail;
    tituloController.text = widget.currentTitulo;
    especialidadController.text = widget.currentEspecialidad;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Correo electrónico'),
            ),
            TextField(
              controller: especialidadController,
              decoration: InputDecoration(labelText: 'Especialidad'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': nameController.text,
                  'email': emailController.text,
                  'especialidad': especialidadController.text,
                });
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
