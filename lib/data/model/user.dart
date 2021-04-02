import 'package:flutter/cupertino.dart';
import 'package:snack_chat/util/color_util.dart';

class User {
  final String id;
  final String email;
  final String username;
  final String chatIconColor;

  const User({this.id, this.email, this.username, this.chatIconColor});

  Color getChatIconColor() {
    return ColorUtil.getColorFromColorName(chatIconColor);
  }

  Map<String, dynamic> toMap() {
    if (this.id == null) {
      return {'email': email, 'username': username, 'chat_icon_color': chatIconColor};
    }
    return {
      'id': id,
      'email': email,
      'username': username,
      'chat_icon_color': chatIconColor
    };
  }
}
