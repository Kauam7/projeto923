
import 'package:flutter/material.dart';
import 'profile_list_screen.dart'; // Importa a tela de listagem de perfis


void main() {
  runApp(const MyApp()); // Inicia o aplicativo com MyApp
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Perfil', // Título do app
      theme: ThemeData(primarySwatch: Colors.blue), // Define o tema azul
      home: const ProfileListScreen(), // Tela inicial do app
    );
  }
}

