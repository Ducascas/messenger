import 'package:chat_app/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> saveUser(User user) async {
    final docRef = _firestore.collection('users').doc(user.id);
    await docRef.set({
      'name': user.name,
      'surName': user.surname,
      'password': user.password,
      'status': user.status,
    });
  }

  static Future<void> updateStatus(User user, bool status) async {
    final docRef = _firestore.collection('users').doc(user.id);
    await docRef.update({
      'status': status,
    });
  }

  static Future<User?> getUser(String id) async {
    final docRef = _firestore.collection('users').doc(id);
    final docSnap = await docRef.get();
    if (docSnap.exists) {
      final data = docSnap.data() as Map<String, dynamic>;
      return User(
        id: id,
        name: data['name'] as String,
        surname: data['surName'] as String,
        password: data['password'] as String,
        status: data['status'] as bool,
      );
    }
    return null;
  }

  static Stream<List<User>> getUsers() {
    final ref = _firestore.collection('users').orderBy('name');
    return ref.snapshots().map((snapshot) {
      final users = snapshot.docs.map((doc) {
        final data = doc.data();
        return User(
          id: doc.id,
          name: data['name'] as String,
          surname: data['surName'] as String,
          password: data['password'] as String,
          status: data['status'] as bool,
        );
      }).toList();
      return users;
    });
  }

  static String chatId(String senderId, String receiverId) {
    List<String> listUser = [senderId, receiverId];
    listUser.sort();
    String chatId = listUser.join("_");
    return chatId;
  }

  static Future<void> saveMessage(Message message) async {
    final chatId = FirebaseService.chatId(message.senderId, message.receiverId);
    final docRef =
        _firestore.collection('chats').doc(chatId).collection('messages');

    await docRef.add({
      'receiverId': message.receiverId,
      'content': message.content,
      'timestamp': message.timestamp,
    });
  }

  static Stream<List<Message>> getMessages(String senderId, String receiverId) {
    final chatId = FirebaseService.chatId(senderId, receiverId);
    final ref = _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true);
    return ref.snapshots().map((snapshot) {
      final messages = snapshot.docs.map((doc) {
        final data = doc.data();
        return Message(
          senderId: data['receiverId'] as String,
          receiverId: senderId,
          content: data['content'] as String,
          timestamp: data['timestamp'] as Timestamp,
        );
      }).toList();
      return messages;
    });
  }

  static Stream<Message?> getLastMessage(String senderId, String receiverId) {
    final chatId = FirebaseService.chatId(senderId, receiverId);
    final ref = _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .limit(1);
    return ref.snapshots().map((snapshot) {
      final message = snapshot.docs
          .map((doc) {
            final data = doc.data();
            return Message(
              senderId: data['receiverId'] as String,
              receiverId: senderId,
              content: data['content'] as String,
              timestamp: data['timestamp'] as Timestamp,
            );
          })
          .toList()
          .last;
      return message;
    });
  }
}
