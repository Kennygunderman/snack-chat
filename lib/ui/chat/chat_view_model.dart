import 'package:snack_chat/data/model/chat.dart';
import 'package:snack_chat/data/repo/chat_repo.dart';
import 'package:snack_chat/data/repo/user_repo.dart';

class ChatViewModel {
  final ChatRepo chatRepo;
  final UserRepo userRepo;

  ChatViewModel({this.chatRepo, this.userRepo});

  List<ChatMessage> _messages = [];

  Stream<List<ChatMessage>> getChatMessages(String chatRoomId) {
    return chatRepo
        .getMessageUpdates(chatRoomId)
        .map((update) => _handleUpdatedMessage(update));
  }

  List<ChatMessage> _handleUpdatedMessage(ChatMessage message) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    if (index == -1) {
      //message is new, append to list
      _messages.add(message);
    } else {
      _messages[index] = message; //update existing message
    }

    _messages.sort((a, b) => b.date.compareTo(a.date)); //yolo
    return _messages;
  }

  void saveMessage(String chatRoomId, String message) async {
    final user = await userRepo.getUser();
    chatRepo.saveMessage(
      ChatMessage(
        chatRoomId: chatRoomId,
        date: DateTime.now(),
        userEmail: user.email,
        username: user.username,
        message: message,
      )
    );
  }
}
