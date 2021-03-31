import 'package:flutter/material.dart';
import 'package:snack_chat/data/model/chatroom.dart';
import 'package:snack_chat/data/repo/chatroom_repo.dart';
import 'package:snack_chat/ui/chatroom/chatroom_list_item.dart';
import 'package:snack_chat/ui/chatroom/chatroom_view_model.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ChatRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = ChatRoomViewModel(chatRoomRepo: ChatRoomRepo());
    return StreamBuilder<List<ChatRoom>>(
      stream: viewModel.chatRooms,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Snack Chat'),
            ),
            body: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return StickyHeader(
                  header: Container(
                    height: 100.0,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Chat Rooms',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                  content: Column(
                    children: snapshot.data
                        .map(
                          (item) => ChatRoomListItem(
                            title: item.title,
                            numUsers: item.numUsers,
                          ),
                        )
                        .toList(growable: false),
                  ),
                );
              },
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
