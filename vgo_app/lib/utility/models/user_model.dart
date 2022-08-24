class UserModel {
  String firstName;
  String lastName;
  String email;
  String password;
  String? phoneNumber;
  int? points;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.phoneNumber = '',
    this.points = 0,
  });
}
