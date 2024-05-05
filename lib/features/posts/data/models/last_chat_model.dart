

class LastChat {
  final String? content;
  final String? time;

  LastChat({
   
     this.content,
     this.time,
   
  });

  factory LastChat.fromJson(Map<String, dynamic>? json) {
    return LastChat(
     
      content: json?['content'],
      time: json?['time'],
      
    );
  }
}