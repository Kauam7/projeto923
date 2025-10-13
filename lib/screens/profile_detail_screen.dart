
import 'package:flutter/material.dart';
import '../model/profile.dart';

class ProfileDetailScreen extends StatelessWidget {
  final Profile profile;

  const ProfileDetailScreen({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            profile.photoPath != null
                ? CircleAvatar(radius: 50, backgroundImage: AssetImage(profile.photoPath!))
                : const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 16),
            Text(profile.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(profile.email, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('CEP: ${profile.cep}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Endereço: ${profile.address}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

