import 'package:flutter/material.dart';
import 'package:snack_chat/data/model/chatroom.dart';

class ChatRoomListItem extends StatelessWidget {
  final ChatRoom chatRoom;
  final Function(ChatRoom) onTapped;
  ChatRoomListItem({Key key, this.chatRoom, this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 8, right: 8, left: 8),
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              onTapped(chatRoom);
            },
            child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[500],
                          border: Border.all(
                            color: Colors.blue[500],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.all_inclusive_rounded),
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(chatRoom.title),
                        Text('Total Snackers: ' + chatRoom.numUsers.toString())
                      ],
                    ),
                  ]),
                  Spacer(),
                  Icon(Icons.navigate_next),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
