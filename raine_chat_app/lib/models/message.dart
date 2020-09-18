import 'dart:convert';

class Message {
  String name;
  String message;
  String timestamp;
  Message({
    this.name,
    this.message,
    this.timestamp,
  });

  Message copyWith({
    String name,
    String message,
    String timestamp,
  }) {
    return Message(
      name: name ?? this.name,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'message': message,
      'timestamp': timestamp,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Message(
      name: map['name'],
      message: map['message'],
      timestamp: map['timestamp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source));

  @override
  String toString() => 'Message(name: $name, message: $message, timestamp: $timestamp)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Message &&
      o.name == name &&
      o.message == message &&
      o.timestamp == timestamp;
  }

  @override
  int get hashCode => name.hashCode ^ message.hashCode ^ timestamp.hashCode;
}
