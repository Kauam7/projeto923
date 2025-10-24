class Transcricao {
  late String contant;
  late String lang;

  Transcricao({
    required this.contant,
    required this.lang,

  });
  Transcricao.fromJson(Map<String, dynamic> json) {
    // if(json['cep'] != null){
    //   cep = json['cep'];
    // } else {
    //   json['cep'] = '';
    // }
    contant = json['contant'] ?? '';
    lang = json['lang'] ?? '';
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contant'] = this.contant;
    data['lang'] = this.lang;
    return data;
  }
}
