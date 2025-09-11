class UserModel{
  int? id;
  String name;
  String email;
  String? password;
  String phone_number;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.password,
    required this.phone_number,
  });

  // Convert JSON to User Model
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone_number: json['phone_number']);
  }


  // Convert User Model to Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'phone_number': phone_number,
    };
    if (password != null) {
      // On ajoute le mot de passe seulement s'il existe
      data['password'] = password;
    }
    return data;
  }


}