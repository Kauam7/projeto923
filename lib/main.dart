
import 'package:flutter/material.dart';
import 'pages/Quiz.dart';
/*
import 'screens/profile_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProfileListScreen(),
    );
  }
*/

import 'pages/home_page.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto 923',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }

/* 
fdgfd
*/}
