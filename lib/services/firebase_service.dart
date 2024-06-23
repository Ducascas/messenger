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
        );
      }).toList();
      return users;
    });
  }

  static Future<void> saveMessage(Message message) async {
    final docRef = _firestore
        .collection('chats')
        .doc(
          message.senderId + message.receiverId,
        )
        .collection('messages')
        .doc(message.timestamp.toString());
    await docRef.set({
      'receiverId': message.receiverId,
      'content': message.content,
      'timestamp': message.timestamp,
    });
  }

  static Stream<List<Message>> getMessages(String senderId, String receiverId) {
    final ref = _firestore
        .collection('chats')
        .doc(senderId + receiverId)
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
}
