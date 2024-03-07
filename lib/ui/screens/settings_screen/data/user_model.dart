class User {
  String name;
  String? surname;
  String? email;
  String? phoneNumber;
  String? profileImage;
  User({
    required this.name,
    this.surname,
    this.email,
    this.phoneNumber,
    this.profileImage,
  });
}
