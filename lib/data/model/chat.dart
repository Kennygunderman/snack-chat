import 'package:intl/intl.dart';

class ChatMessage {
  final String id; //will be null for new objects
  final DateTime date;
  final String chatRoomId;
  final String firstName;
  final String message;

  const ChatMessage({this.id, this.date, this.chatRoomId, this.firstName, this.message});

  String get timeStamp {
    return DateFormat('MMM d, h:mm a').format(date);
  }

  Map<String, dynamic> toMap() {
    if (this.id == null) {
      return {
        'send_date': date,
        'chatroom_id': chatRoomId,
        'first_name': firstName,
        'message': message,
      };
    }
    return {
      'id': id,
      'send_date': date,
      'chatroom_id': chatRoomId,
      'first_name': firstName,
      'message': message,
    };
  }
}
