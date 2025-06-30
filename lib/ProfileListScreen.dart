
import 'dart:io';


import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'profile_screen.dart';
import 'register_screen.dart';


class ProfileListScreen extends StatefulWidget {
  const ProfileListScreen({super.key});


  @override
  State<ProfileListScreen> createState() => _ProfileListScreenState();
}


class _ProfileListScreenState extends State<ProfileListScreen> {
  List<Map<String, dynamic>> profiles = [];


  @override
  void initState() {
    super.initState();
    _loadProfiles();
  }


  Future<void> _loadProfiles() async {
    final data = await DBHelper.getProfiles();
    setState(() {
      profiles = data;
    });
  }


  void _openProfile(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProfileScreen(profileId: id),
      ),
    ).then((_) => _loadProfiles());
  }


  void _createNewProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegisterScreen()),
    ).then((_) => _loadProfiles());
  }


  Future<void> _deleteProfile(int id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: const Text('Deseja realmente apagar este perfil?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Apagar'),
          ),
        ],
      ),
    );


    if (confirmed == true) {
      await DBHelper.deleteProfile(id);
      await _loadProfiles();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perfil apagado com sucesso!')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfis'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _createNewProfile,
            tooltip: 'Criar novo perfil',
          ),
        ],
      ),
      body: profiles.isEmpty
          ? const Center(child: Text('Nenhum perfil cadastrado.'))
          : ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: profile['photoPath'] != null
                  ? FileImage(File(profile['photoPath']))
                  : null,
              child:
              profile['photoPath'] == null ? const Icon(Icons.person) : null,
            ),
            title: Text(profile['name']),
            subtitle: Text(profile['email']),
            onTap: () => _openProfile(profile['id']),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              tooltip: 'Apagar perfil',
              onPressed: () => _deleteProfile(profile['id']),
            ),
          );
        },
      ),
    );
  }
}
