import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  ChatModel({
    required this.username,
    required this.userImage,
    required this.userId,
  });

  late final String username;
  late final String userImage;
  late final String userId;

  ChatModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] ?? '';
    userImage = json['userImage'] ?? '';
    userId = json['userId'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'userImage': userImage,
      'userId': userId,
    };
  }
}
class Message {
  final String text;
  final String userId;
  final Timestamp dateTime;

  Message({
    required this.text,
    required this.userId,
    required this.dateTime,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text'],
      userId: json['userId'],
      dateTime: json['dateTime'],
    );
  }
}