import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:snack_chat/util/color_util.dart';

class ChatMessage {
  final String id; //will be null for new objects
  final DateTime date;
  final String chatRoomId;
  final String username;
  final String userEmail;
  final String chatIconColor;
  final String message;

  const ChatMessage({
    this.id,
    this.date,
    this.username,
    this.userEmail,
    this.chatRoomId,
    this.message,
    this.chatIconColor,
  });

  String get chatAbbreviation {
    return username.substring(0, 2).toUpperCase();
  }

  Color getChatIconColor() {
    return ColorUtil.getColorFromColorName(chatIconColor);
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
      'user_email': userEmail,
      'chat_icon_color': chatIconColor
    };
  }
}
