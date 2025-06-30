
import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'profile_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}


class _RegisterScreenState extends State<RegisterScreen> {


  final _nameController = TextEditingController();
  final _emailController = TextEditingController();


  // regist perf
  Future<void> _register() async {
    final name = _nameController.text.trim(); // Remov espaços
    final email = _emailController.text.trim();


    // Valid  camps vasio
    if (name.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha nome e email')),
      );
      return;
    }


    // Inser perf no bc e obt o ID gerd
    final id = await DBHelper.insertProfile({'name': name, 'email': email});


    //  tela de perf dps cadastro
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ProfileScreen(profileId: id),
      ),
    );
  }


  @override
  void dispose() {
    // Libr memoria controlller
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Perfil'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // volt
          onPressed: () => Navigator.pop(context), // tela anterior
          tooltip: 'Voltar',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress, // Teclado em
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _register, // chma cadastro
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}


