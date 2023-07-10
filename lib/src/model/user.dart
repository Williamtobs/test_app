class Users {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final List interest;

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.interest,
    required this.username,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      username: json['username'] ?? '',
      interest: json['interest'] ?? [],
    );
  }
}
