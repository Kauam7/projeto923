
import 'package:flutter/material.dart';
import '../model/profile.dart';
import '../services/api_service.dart';
import 'profile_detail_screen.dart';
import 'edit_profile_screen.dart';

class ProfileListScreen extends StatefulWidget {
  const ProfileListScreen({Key? key}) : super(key: key);

  @override
  _ProfileListScreenState createState() => _ProfileListScreenState();
}

class _ProfileListScreenState extends State<ProfileListScreen> {
  late Future<List<Profile>> _futureProfiles;

  @override
  void initState() {
    super.initState();
    _futureProfiles = ApiService.getProfiles();
  }

  void _refreshProfiles() {
    setState(() {
      _futureProfiles = ApiService.getProfiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfis')),
      body: FutureBuilder<List<Profile>>(
        future: _futureProfiles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum perfil encontrado.'));
          }

          final profiles = snapshot.data!;
          return ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              final profile = profiles[index];
              return ListTile(
                leading: profile.photoPath != null
                    ? CircleAvatar(backgroundImage: AssetImage(profile.photoPath!))
                    : const CircleAvatar(child: Icon(Icons.person)),
                title: Text(profile.name),
                subtitle: Text(profile.email),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProfileDetailScreen(profile: profile),
                    ),
                  );
                  _refreshProfiles();
                },
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditProfileScreen(profile: profile),
                      ),
                    );
                    _refreshProfiles();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
