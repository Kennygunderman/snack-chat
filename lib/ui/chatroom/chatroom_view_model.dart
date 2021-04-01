import 'package:snack_chat/data/model/chatroom.dart';
import 'package:snack_chat/data/repo/chatroom_repo.dart';

class ChatRoomViewModel {
  final ChatRoomRepo _chatRoomRepo;
  ChatRoomViewModel({ChatRoomRepo chatRoomRepo}) : _chatRoomRepo = chatRoomRepo;

  Stream<List<ChatRoom>> get chatRooms { return _chatRoomRepo.getChatRooms(); }
}