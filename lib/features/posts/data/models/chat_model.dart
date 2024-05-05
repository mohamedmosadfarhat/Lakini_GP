class Chat {
  final String senderId;
  final String receiverId;
  final String? content;
  final String timestamp;
  final String? file;
  final double latitude;
  final double longitude;

  Chat({
    required this.senderId,
    required this.receiverId,
     this.content,
    required this.timestamp,
    required this.latitude,
    required this.longitude,
     this.file,
  });

  factory Chat.fromJson(Map<String, dynamic>? json) {
    return Chat(
      senderId: json?['senderId'],
      receiverId: json?['receiverId'],
      content: json?['content'],
      timestamp: json?['timestamp'],
      file: json?['file'],
      latitude: json?['latitude'].toDouble(),
      longitude: json?['longitude'].toDouble(),
    );
  }
}

class SendMessageModel {
  final String receiverEmail;
  final String message;

  SendMessageModel({required this.receiverEmail, required this.message});

  Map<String, dynamic> toJson() {
    return {
      'receiverEmail': receiverEmail,
      'message': message,
    };
  }
}