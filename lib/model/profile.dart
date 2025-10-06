
class Profile {
  final int? id;
  final String name;
  final String email;
  final String cep;
  final String address;
  String? photoPath;

  Profile({
    this.id,
    required this.name,
    required this.email,
    required this.cep,
    required this.address,
    this.photoPath,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      cep: map['cep'],
      address: map['address'],
      photoPath: map['photoPath'],
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'name': name,
      'email': email,
      'cep': cep,
      'address': address,
    };
    if (photoPath != null) {
      map['photoPath'] = photoPath;
    }
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
