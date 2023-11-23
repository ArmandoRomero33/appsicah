import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sicahapp_v2/HomePage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
      theme: ThemeData(
        primaryColor: Colors.green,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final String apiUrl = 'https://edulink-vmob.onrender.com/api/users/login/';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'username': usernameController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];

      final storage = FlutterSecureStorage();
      await storage.write(key: 'auth_token', value: token);

      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Inicio de sesión fallido',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/e/e5/Logotipo_utt2.png',
                height:
                    250, // Ajusta este valor para cambiar el tamaño de la imagen
                width:
                    250, // Ajusta este valor para cambiar el tamaño de la imagen
              ),
              SizedBox(height: 16),
              TextField(
                controller: usernameController,
                style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                  labelText: 'Nombre de usuario o correo',
                  prefixIcon: Icon(Icons.person, color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock, color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: login,
                child: Text('Iniciar sesión'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 102, 226, 91),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(8),
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Text(
          '© 2023 MalincheSoftware. Todos los derechos reservados.',
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}
