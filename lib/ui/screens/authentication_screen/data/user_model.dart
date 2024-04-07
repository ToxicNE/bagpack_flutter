class User {
  String? name;
  String? surname;
  String? email;
  String? phoneNumber;
  String? profileImage;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        surname: json['surname'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        profileImage: json['profileImage'],
      );
  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
        'email': email,
        'phoneNumber': phoneNumber,
        'profileImage': profileImage,
      };

  User({
    this.name,
    this.surname,
    this.email,
    this.phoneNumber,
    this.profileImage,
  });
}
