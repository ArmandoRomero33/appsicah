import 'package:flutter/material.dart';
import 'package:sicahapp_v2/models/perfil_maestro.dart';

class UserProvider extends ChangeNotifier {
  late PerfilMaestro _perfilMaestro;

  PerfilMaestro get perfilMaestro => _perfilMaestro;

  void setMaestro(PerfilMaestro perfilMaestro) {
    _perfilMaestro = perfilMaestro;
    notifyListeners();
  }
}
