import 'dart:convert';

import 'package:app_delivery/controllers/home.controller.dart';
import 'package:app_delivery/pages/home.page.dart';

class UsuarioModel {
  String? nome;
  String? email; 
  String? senha;

  UsuarioModel({
    required this.nome,
    required this.email,
    required this.senha,
  });
  UsuarioModel.usuarioVazio();

  UsuarioModel.fromMap(Map<String, dynamic> dados) {
    email = dados['email'];
    nome = dados['nome'];
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "email": email,
      "senha": senha,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
