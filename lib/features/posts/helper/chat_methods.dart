import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../register/helper/end_point.dart';
import '../data/models/chat_model.dart';

Future<void> fetchChats(
    {required String senderEmail,
    required String receiverEmail,
    required streamController}) async {
  final response = await http.get(Uri.parse(
      '$url/api/Chat/Get-All-Chat?senderEmail=$senderEmail&receiverEmail=$receiverEmail'),
       headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      'Content-Type': 'application/json',
    },);
  print('Response status code: ${response.statusCode}');
  print('Response body: ${response.body}');
  print(senderEmail);
  print(receiverEmail);

  if (response.statusCode == 200) {
    final dynamic responseBody = json.decode(response.body);

    if (responseBody is List<dynamic>) {
      final List<Chat> chats =
          responseBody.map((json) => Chat.fromJson(json)).toList();
      streamController.add(chats);
    } else if (responseBody is Map<String, dynamic>) {
      final Chat chat = Chat.fromJson(responseBody);
      streamController.add([chat]);
    } else {
      throw Exception('Unexpected response format');
    }
  } else {
    throw Exception('Failed to load chats');
  }
}
