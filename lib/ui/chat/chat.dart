import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snack_chat/data/model/chat.dart';
import 'package:snack_chat/data/model/chatroom.dart';
import 'package:snack_chat/data/repo/chat_repo.dart';
import 'package:snack_chat/data/repo/chatroom_repo.dart';
import 'package:snack_chat/data/repo/user_repo.dart';
import 'package:snack_chat/ui/chat/chat_list_item.dart';
import 'package:snack_chat/ui/chat/chat_view_model.dart';

class ChatPage extends StatelessWidget {
  final String title;
  final ChatRoom chatRoom;

  ChatPage({Key key, this.title, this.chatRoom}) : super(key: key);
  final viewModel = ChatViewModel(ChatRepo(), UserRepo(), ChatRoomRepo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          StreamBuilder<List<ChatMessage>>(
            stream: viewModel.getChatMessages(chatRoom.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    physics: BouncingScrollPhysics(),
                    reverse: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ChatListItem(chatMessage: snapshot.data[index]);
                    },
                  ),
                );
              }
              return Expanded(
                child: Center(
                  child: Text(
                    '🌶️ Be the first to leave a spicy message 🌶️',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              );
            },
          ),
          Container(height: 1, color: Colors.grey[500]),
          SizedBox(height: 8),
          _textInput(context),
          SizedBox(height: 48),
        ],
      ),
    );
  }

  Widget _textInput(BuildContext context) {
    final controller = TextEditingController();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 16),
        Flexible(
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            obscureText: false,
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey.shade100),
              hintText: 'Send message',
            ),
          ),
        ),
        SizedBox(width: 12),
        IconButton(
          icon: Icon(viewModel.getIconInfo(chatRoom.icon).iconData),
          onPressed: () {
            viewModel.saveIconMessage(chatRoom.id, chatRoom.icon);
          },
        ),
        IconButton(
          icon: Icon(Icons.send_rounded),
          onPressed: () {
            viewModel.saveMessage(chatRoom.id, controller.value.text);
            controller.text = "";
          },
        ),
        SizedBox(width: 16)
      ],
    );
  }
}
