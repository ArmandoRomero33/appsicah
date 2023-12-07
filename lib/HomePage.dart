import 'package:flutter/material.dart';
import 'package:sicahapp_v2/models/perfil_maestro.dart';
import 'package:sicahapp_v2/providers/user_provider.dart';
import 'horas.dart';
import 'notificaciones.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
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
    //obtener datos del maestro
    PerfilMaestro? perfilMaestro =
        Provider.of<UserProvider>(context).perfilMaestro;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SICHAPP',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(perfilMaestro.employee.photo),
              ),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  children: [
                    Text(
                      'Información del Maestro',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      perfilMaestro.user.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Table(
                      children: [
                        TableRow(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Correo electrónico',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(perfilMaestro.user.email),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Teléfono Celular',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(perfilMaestro.employee.phone),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Titulo Academico',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(perfilMaestro.employee.academicTitle),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: const BoxDecoration(
                              // border: Border(
                              //   bottom: BorderSide(
                              //     color: Colors.grey,
                              //     width: 1,
                              //   ),
                              // ),
                              ),
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Especialidad',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(perfilMaestro.employee.speciality),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(children: [
                  Text(
                    'Descripción del maestro',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(perfilMaestro.position.description),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ]),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time,
                color: Colors.white), // Icono en color blanco
            label: 'Materias que Impartirá',
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
