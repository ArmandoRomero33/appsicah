import 'package:flutter/material.dart';

class HorasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horario del Profesor'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Horario del Profesor',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DataTable(
              columns: [
                DataColumn(label: Text('Día')),
                DataColumn(label: Text('Hora')),
                DataColumn(label: Text('Asignatura')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Lunes')),
                  DataCell(Text('08:00 AM - 10:00 AM')),
                  DataCell(Text('Matemáticas')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Martes')),
                  DataCell(Text('10:30 AM - 12:30 PM')),
                  DataCell(Text('Historia')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Miércoles')),
                  DataCell(Text('09:00 AM - 11:00 AM')),
                  DataCell(Text('Ciencias')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Jueves')),
                  DataCell(Text('08:30 AM - 10:30 AM')),
                  DataCell(Text('Inglés')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Viernes')),
                  DataCell(Text('10:00 AM - 12:00 PM')),
                  DataCell(Text('Educación Física')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
