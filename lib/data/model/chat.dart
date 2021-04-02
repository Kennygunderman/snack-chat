import 'package:intl/intl.dart';

class ChatMessage {
  final String id; //will be null for new objects
  final DateTime date;
  final String chatRoomId;
  final String username;
  final String userEmail;
  final String message;

  const ChatMessage(
      {this.id, this.date, this.username, this.userEmail, this.chatRoomId, this.message});

  String get chatAbbreviation {
    return username.substring(0, 2).toUpperCase();
  }

  String get timeStamp {
    return DateFormat('MMM d, h:mm a').format(date);
  }

  Map<String, dynamic> toMap() {
    return {
      'send_date': date,
      'chatroom_id': chatRoomId,
      'message': message,
      'username': username,
      'user_email': userEmail
    };
  }
}
