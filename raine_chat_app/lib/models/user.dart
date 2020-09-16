import 'dart:convert';

class User {
  String id;
  String username; 
  String password; 
  User({
    this.id,
    this.username,
    this.password,
  });

  User copyWith({
    String id,
    String username,
    String password,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return User(
      id: map['id'],
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(id: $id, username: $username, password: $password)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is User &&
      o.id == id &&
      o.username == username &&
      o.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ password.hashCode;
}
