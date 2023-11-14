import 'package:flutter/material.dart';

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
        title: const Text(
          'Editar Perfil',
          textAlign: TextAlign.center,
        ),
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
              controller: tituloController,
              decoration: InputDecoration(labelText: 'Titulo Academico'),
            ),
            TextField(
              controller: especialidadController,
              decoration: InputDecoration(labelText: 'Especialidad'),
            ),
            ElevatedButton(
              onPressed: () {
                // Actualiza los datos personales y regresa a la página de inicio
                Navigator.pop(context, {
                  'name': nameController.text,
                  'email': emailController.text,
                  'titulo academico': tituloController.text,
                  'especialidad': especialidadController.text,
                });
              },
              child: Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
