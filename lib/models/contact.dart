class ContactModel {
  int? id;
  String user_id;
  String owner_id;
  String last_name;
  String first_name;
  String email;
  String phone_number;

  ContactModel({
    this.id,
    required this.user_id,
    required this.owner_id,
    required this.last_name,
    required this.first_name,
    required this.email,
    required this.phone_number,
  });

  // Convert JSON to Contact Model
  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      user_id: json['user_id'],
      owner_id: json['owner_id'],
      last_name: json['last_name'],
      first_name: json['first_name'],
      email: json['email'],
      phone_number: json['phone_number']);
  }

  // Convert Contact Model to Json
  Map<String,dynamic> toJson() {
    return {
      'id' : id,
      'user_id' : user_id,
      'owner_id' : owner_id,
      'last_name' : last_name,
      'first_name' : first_name,
      'email' : email,
      'phone_number' : phone_number,
    };
  }

}