
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'db_helper.dart';
import 'register_screen.dart';


class ProfileScreen extends StatefulWidget {
  final int profileId;


  const ProfileScreen({super.key, required this.profileId});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? profile; // Dados do perf
  File? imageFile; // Imgm de perf


  @override
  void initState() {
    super.initState();
    _loadProfile(); // Carrega o perf
  }




  Future<void> _loadProfile() async {
    final prof = await DBHelper.getProfileById(widget.profileId);
    setState(() {
      profile = prof;
      if (prof?['photoPath'] != null) {
        imageFile = File(prof!['photoPath']); // Carrega igm se e
      }
    });
  }


  // slc image glr
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);


    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
      });




      await DBHelper.updateProfilePhoto(profile!['id'], picked.path);
      await _loadProfile();
    }
  }


  @override
  Widget build(BuildContext context) {
    if (profile == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }




    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'Lista de perfis',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/'); // vlt a list
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Criar outro perfil',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const RegisterScreen()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar
              GestureDetector(
                onTap: _pickImage, // open glr
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
                  child: imageFile == null
                      ? const Icon(Icons.camera_alt, size: 40, color: Colors.white70)
                      : null,
                ),
              ),
              const SizedBox(height: 24),
              // Exb  name perf
              Text(
                'Nome: ${profile!['name']}',
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              // Exb email perfr
              Text(
                'Email: ${profile!['email']}',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
