class UserDataModel {
  String? name;
  String? gender;
  String? email;

  UserDataModel({this.name, this.email, this.gender});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'email': email,
    };
  }
}
