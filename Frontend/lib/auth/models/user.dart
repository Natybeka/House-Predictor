class User {
  final String? id;
  final String? username;
  final String? email;
  final String? password;
  final List<dynamic>? roles;
  final String? accessToken;

  User(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.roles,
      this.accessToken});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        roles: json['roles'],
        accessToken: json["accessToken"]);
  }
}
