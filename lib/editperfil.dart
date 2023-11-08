import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String currentName;
  final String currentEmail;

  EditProfilePage({required this.currentName, required this.currentEmail});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Aquí puedes agregar campos de edición y lógica para guardar la información.
  // Por ejemplo, puedes utilizar TextFields para que los usuarios editen el nombre y el correo electrónico.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Agrega TextFields para editar el nombre y el correo electrónico aquí.
            // Utiliza los valores iniciales de widget.currentName y widget.currentEmail
            // como valor inicial para los TextFields.
          ],
        ),
      ),
    );
  }
}
