import 'dart:async';
import '../model/profile.dart';

class ApiService {
  static List<Profile> _profiles = [
    Profile(id: 1, name: "João", email: "joao@mail.com", cep: "12345-678", address: "Rua A, 123"),
    Profile(id: 2, name: "Maria", email: "maria@mail.com", cep: "87654-321", address: "Avenida B, 456"),
  ];

  static Future<List<Profile>> getProfiles() async {
    await Future.delayed(const Duration(seconds: 1));
    return _profiles;
  }

  static Future<bool> updateProfile(Profile profile) async {
    await Future.delayed(const Duration(seconds: 1));
    int index = _profiles.indexWhere((p) => p.id == profile.id);
    if (index >= 0) {
      _profiles[index] = profile;
      return true;
    }
    return false;
  }
}
