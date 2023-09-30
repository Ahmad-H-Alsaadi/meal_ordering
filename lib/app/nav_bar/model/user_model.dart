class UserModel {
  String name;
  String email;
  String phoneNumber;
  String password;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  // Convert the Account object to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      // You might want to avoid serializing the password for security reasons
      // 'password': password,
    };
  }

  // Create an Account object from a JSON Map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      password: json['password'] ?? '',
    );
  }
}
