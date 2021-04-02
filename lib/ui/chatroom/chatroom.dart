import 'package:flutter/material.dart';
import 'package:snack_chat/data/model/chatroom.dart';
import 'package:snack_chat/data/repo/chatroom_repo.dart';
import 'package:snack_chat/service/auth/auth_service.dart';
import 'package:snack_chat/ui/chat/chat.dart';
import 'package:snack_chat/ui/chatroom/chatroom_list_item.dart';
import 'package:snack_chat/ui/chatroom/chatroom_view_model.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:provider/provider.dart';

class ChatRoomPage extends StatelessWidget {
  final viewModel = ChatRoomViewModel(chatRoomRepo: ChatRoomRepo());

  void _onChatRoomItemTapped(BuildContext context, ChatRoom chatRoom) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ChatPage(chatRoom: chatRoom, title: chatRoom.title)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatRoom>>(
      stream: viewModel.chatRooms,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Snack Chat'),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.logout), onPressed: () {
                  context.read<AuthService>().signOut();
                })
              ],
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
                            chatRoom: item,
                            onTapped: (chatRoom) =>
                                _onChatRoomItemTapped(context, chatRoom),
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
