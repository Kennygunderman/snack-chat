import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snack_chat/data/model/chat.dart';

class ChatListItem extends StatelessWidget {

  final ChatMessage chatMessage;
  ChatListItem({Key key, this.chatMessage}) : super(key: key);

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
              child: Text('KG'),
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
                      'kennygunderman',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Text(chatMessage.timeStamp),
                  ],
                ),
                SizedBox(height: 4),
                Text(chatMessage.message),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
