import 'package:flutter/material.dart';
import 'package:projeto_923/Quiz.dart';

void main() {
  runApp(QuizApp());
}

//deumerda
//FUNCAO PRINCIPAL
void main() {
  runApp(const MyApp());
}

//CRIA A ESTRUTURA DO APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil',
      theme: ThemeData( //define cor e estilo
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFFF4ECF9), // roxo bem claro
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF7B1FA2), // roxo escuro
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: const TextTheme( //textTheme: ajuda a manter tudo padronizado nome, email, texto
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFD1C4E9), // roxo claro
            foregroundColor: Colors.black,
            minimumSize: Size(double.infinity, 48),
          ),
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}


//TELA PRINCIPAL
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});




  @override
  Widget build(BuildContext context) {
    //ESTRUTURA DA TELA COM SCAFFOLD
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),


      //CORPO DA TELA
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0), //cria espaco interno ao redor dos obejtos
        child: Column( //organiza os elementos verticalmente de cima pra baixo
          children: <Widget>[
            // Imagem de perfil
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://www.opovo.com.br/_midias/jpg/2022/05/11/750x500/1_animes_japoneses_entenda_o_que_sao_e_o_porque_de_fazerem_tanto_sucesso-18726989.jpg',
              ), //usa uma imagem da web via NetworkImage
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 20),




            // Nome
            const Text(
              'ÉoTreem7',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A1B9A), // roxo médio
              ),
            ),




            // E-mail
            const SizedBox(height: 8),
            const Text(
              '923EoTreem@gamil.com',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),




            // Botão Editar Perfil
            ElevatedButton(
              onPressed: () {},
              child: const Text('Editar Perfil'),
            ),
            const SizedBox(height: 12),




            // Botão Sair
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // tom diferente para "Sair"
                foregroundColor: Colors.white,
              ),
              child: const Text('Sair'),
            ),
            const SizedBox(height: 32),




            const Divider(),




            // Lista de opções
            ListTile(
              title: const Text('Informações'), //botao de acao
              trailing: const Icon(Icons.chevron_right, color: Colors.deepPurple),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text('Notificações'), //botao de acao
              trailing: const Icon(Icons.chevron_right, color: Colors.deepPurple),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text('Privacidade'), // botao de acao
              trailing: const Icon(Icons.chevron_right, color: Colors.deepPurple), //seta indicando que e clicavel
              onTap: () {}, //acao de tocar ainda nao implementada
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
