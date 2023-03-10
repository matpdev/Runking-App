// ignore_for_file: unnecessary_new, unnecessary_this

class UserModel {
  UserModel({
    this.id,
    this.uuid,
    this.email,
    this.name,
    this.token,
    this.phone,
    this.cpf,
    this.rg,
    this.birthDate,
    this.image,
  });

  String? id;
  String? uuid;
  String? email;
  String? name;
  String? phone;
  String? gender;
  String? cpf;
  String? rg;
  String? birthDate;
  String? image;
  String? token;

  void clearData() {
    email = null;
    uuid = null;
    id = null;
    name = null;
    phone = null;
    cpf = null;
    rg = null;
    birthDate = null;
    image = null;
    token = null;
    gender = null;
  }

  void setData(Map jsonData) {
    if (jsonData.isNotEmpty) {
      id = jsonData['id'].toString();
      email = jsonData['email'].toString();
      uuid = jsonData["uuid"].toString();
      name = jsonData['name'].toString();
      phone = jsonData['phone'].toString();
      gender = jsonData['gender'].toString();
      cpf = jsonData['cpf'].toString();
      rg = jsonData['rg'].toString();
      birthDate = jsonData['birthDate'].toString();
      image = jsonData['image'].toString();
      token = jsonData['jwt'].toString();
    } else {
      clearData();
    }
  }
}
