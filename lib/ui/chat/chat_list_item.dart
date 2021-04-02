import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snack_chat/data/model/chat.dart';
import 'package:snack_chat/util/icon_helper.dart';

class ChatListItem extends StatelessWidget {
  final ChatMessage chatMessage;

  ChatListItem({Key key, this.chatMessage}) : super(key: key);

  //Icon or message
  Widget _getMessage(String message) {
    if (IconHelper.isIcon(message)) {
      final iconInfo = IconHelper.getIconFromMessage(message);
      return Icon(iconInfo.iconData, size: 150, color: iconInfo.color);
    }

    return Text(chatMessage.message);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: chatMessage.getChatIconColor(),
                border: Border.all(
                  color: chatMessage.getChatIconColor(),
                ),
                borderRadius: BorderRadius.all(Radius.circular(32))),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(chatMessage.chatAbbreviation),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      chatMessage.username,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Text(chatMessage.timeStamp),
                  ],
                ),
                SizedBox(height: 4),
                _getMessage(chatMessage.message)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
