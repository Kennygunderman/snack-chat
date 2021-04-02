import 'package:snack_chat/data/model/chat.dart';
import 'package:snack_chat/data/repo/chat_repo.dart';
import 'package:snack_chat/data/repo/chatroom_repo.dart';
import 'package:snack_chat/data/repo/user_repo.dart';
import 'package:snack_chat/util/icon_helper.dart';

class ChatViewModel {
  final ChatRepo _chatRepo;
  final UserRepo _userRepo;
  final ChatRoomRepo _chatRoomRepo;

  ChatViewModel(this._chatRepo, this._userRepo, this._chatRoomRepo);

  List<ChatMessage> _messages = [];

  Stream<List<ChatMessage>> getChatMessages(String chatRoomId) {
    return _chatRepo
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
    final user = await _userRepo.getUser();
    _chatRepo.saveMessage(
      ChatMessage(
        chatRoomId: chatRoomId,
        date: DateTime.now(),
        message: message,
        userEmail: user.email,
        username: user.username,
        chatIconColor: user.chatIconColor,
      ),
    );
  }

  void incrementTotalSnacksSentCount(String chatRoomId) {
    _chatRoomRepo.incrementSnacksSent(chatRoomId);
  }

  void saveIconMessage(String chatRoomId, String iconName) async {
    incrementTotalSnacksSentCount(chatRoomId);
    final message = IconHelper.getMessageFromIconName(iconName);
    saveMessage(chatRoomId, message);
  }

  IconInfo getIconInfo(String iconName) {
    return IconHelper.getIconFromIconName(iconName);
  }
}
