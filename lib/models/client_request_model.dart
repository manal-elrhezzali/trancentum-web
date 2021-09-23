class ClientRequestModel {
  final String adresse;
  final String cinRc;
  final String code;
  final int enCompte;
  final String faxe;
  final String fixe;
  final String ice;
  final String nomRs;
  final String tel;
  final String userId;

  ClientRequestModel(
      {this.adresse,
      this.cinRc,
      this.code,
      this.enCompte = 0,
      this.faxe,
      this.fixe,
      this.ice,
      this.nomRs,
      this.tel,
      this.userId,});

  ClientRequestModel.fromJson(Map<String, dynamic> json)
      : adresse = json['adresse'],
        cinRc = json['cin_rc'],
        enCompte = json['enCompte'],
        code = json['code'],
        faxe = json['faxe'],
        fixe = json['fixe'],
        ice = json['ice'],
        nomRs = json['nom_rs'],
        tel = json['tel'],
        userId = json['utilisateur_id'];

  Map<String, dynamic> toJson() {
    return {
      "adresse": adresse,
      "cin_rc": cinRc,
      "code": code,
      "enCompte": enCompte,
      "faxe": faxe,
      "fixe": fixe,
      "ice": ice,
      "nom_rs": nomRs,
      "tel": tel,
      "utilisateur_id": userId
    };
  }
}
