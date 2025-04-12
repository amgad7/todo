class UserModel {
  String id;
  String email;
  String userName;
  String phone;
  bool emailVerified;

  UserModel(
      {required this.id,
      required this.email,
      required this.userName,
      this.phone = "",
      this.emailVerified = false});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          email: json['email'],
          id: json['id'],
          userName: json['userName'],
          phone: json['phone'],
          emailVerified: json['emailVerified'],
        );
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "id": id,
      "userName": userName,
      "phone": phone,
      "emailVerified": emailVerified,
    };
  }
}
