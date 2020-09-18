import 'dart:convert';

class User {
  String username; 
  String password; 
  User({
    this.username,
    this.password,
  });

  User copyWith({
    String username,
    String password,
  }) {
    return User(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return User(
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(username: $username, password: $password)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is User &&
      o.username == username &&
      o.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
