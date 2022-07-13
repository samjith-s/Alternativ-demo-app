class User {
  User({
    required this.email,
    required this.firstName,
    required this.avatar,
  });

  final String email;
  final String firstName;
  final String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        firstName: json["first_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "first_name": firstName,
        "avatar": avatar,
      };
}
