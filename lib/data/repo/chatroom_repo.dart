import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snack_chat/data/model/chatroom.dart';

class ChatRoomRepo {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('chat_rooms');

  Stream<List<ChatRoom>> getChatRooms() async* {
    final snapshots = _ref.snapshots();

    await for (final snapshot in snapshots) {
      yield snapshot.docs
          .map(
            (doc) => ChatRoom(
              id: doc['id'],
              icon: doc['icon'],
              title: doc['title'],
              numUsers: doc['num_users'],
            ),
          )
          .toList();
    }
  }
}
