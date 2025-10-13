
import 'package:flutter/material.dart';
import '../model/profile.dart';
import '../services/api_service.dart';

class EditProfileScreen extends StatefulWidget {
  final Profile profile;

  const EditProfileScreen({Key? key, required this.profile}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _cepController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _emailController = TextEditingController(text: widget.profile.email);
    _cepController = TextEditingController(text: widget.profile.cep);
    _addressController = TextEditingController(text: widget.profile.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _cepController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    final updatedProfile = Profile(
      id: widget.profile.id,
      name: _nameController.text,
      email: _emailController.text,
      cep: _cepController.text,
      address: _addressController.text,
      photoPath: widget.profile.photoPath,
    );

    bool success = await ApiService.updateProfile(updatedProfile);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perfil atualizado com sucesso!')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Falha ao atualizar perfil.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Nome')),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _cepController, decoration: const InputDecoration(labelText: 'CEP')),
            TextField(controller: _addressController, decoration: const InputDecoration(labelText: 'Endereço')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
