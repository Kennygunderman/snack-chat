import 'package:flutter/material.dart';
import 'package:snack_chat/data/model/chatroom.dart';
import 'package:snack_chat/util/icon_helper.dart';

class ChatRoomListItem extends StatelessWidget {
  final ChatRoom chatRoom;
  final Function(ChatRoom) onTapped;
  ChatRoomListItem({Key key, this.chatRoom, this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconInfo = IconHelper.getIconFromIconName(chatRoom.icon);
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
                          color: iconInfo.color,
                          border: Border.all(
                            color: iconInfo.color,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(iconInfo.iconData),
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(chatRoom.title),
                        Text('Total Snacks sent: ' + chatRoom.snacksSent.toString())
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
