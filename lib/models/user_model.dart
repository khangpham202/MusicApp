class UserModel {
  String? name;
  String? email;
  UserModel({
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, String> json) => UserModel(
        name: json["name"],
        email: json["email"],
      );
}
