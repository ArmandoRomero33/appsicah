import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sicahapp_v2/models/perfil_maestro.dart';
import 'package:sicahapp_v2/providers/user_provider.dart';

class HorasPage extends StatelessWidget {
  const HorasPage({super.key});

  @override
  Widget build(BuildContext context) {
    //obtener datos del maestro
    PerfilMaestro? perfilMaestro =
        Provider.of<UserProvider>(context).perfilMaestro;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Materias del profesor',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
            ],
            rows: perfilMaestro.subjects
                .map(
                  (subjects) => DataRow(cells: [
                    DataCell(Text(subjects.subject)),
                    DataCell(Text(subjects.group)),
                  ]),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
