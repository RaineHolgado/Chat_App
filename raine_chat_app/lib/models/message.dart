import 'dart:convert';

class Message {
  String senderUid;
  String message;
  String timestamp;
  Message({
    this.senderUid,
    this.message,
    this.timestamp,
  });

  Message copyWith({
    String senderUid,
    String message,
    String timestamp,
  }) {
    return Message(
      senderUid: senderUid ?? this.senderUid,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderUid': senderUid,
      'message': message,
      'timestamp': timestamp,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Message(
      senderUid: map['senderUid'],
      message: map['message'],
      timestamp: map['timestamp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source));

  @override
  String toString() => 'Message(senderUid: $senderUid, message: $message, timestamp: $timestamp)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Message &&
      o.senderUid == senderUid &&
      o.message == message &&
      o.timestamp == timestamp;
  }

  @override
  int get hashCode => senderUid.hashCode ^ message.hashCode ^ timestamp.hashCode;
}
