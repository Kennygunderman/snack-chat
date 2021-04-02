import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snack_chat/data/model/chat.dart';
import 'package:snack_chat/util/icon_helper.dart';

class ChatListItem extends StatelessWidget {
  final ChatMessage chatMessage;
  final IconHelper _iconHelper = IconHelper();

  ChatListItem({Key key, this.chatMessage}) : super(key: key);

  //Icon or message
  Widget _getMessage(String message) {
    if (_iconHelper.isIcon(message)) {
      final iconInfo = _iconHelper.getIconFromMessage(message);
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
                color: Colors.blue[500],
                border: Border.all(
                  color: Colors.blue[500],
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
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
