import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizlet_flashcard/model/word.dart';

class FirestoreService {
  Future createUserDB() async {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    final name = user.displayName;
    final data = {
      'username': name,
      'folders': ['Uncategorized'],
    };
    await db.collection('users').doc(uid).set(data, SetOptions(merge: true));
  }

  Future createSet(String name, String folder, Map cards, Map resources) async {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    final username = user.displayName;
    await db.collection('users').doc(uid).update({
      'folders': FieldValue.arrayUnion([folder])
    });
    await db.collection('sets').add({
      'uid': uid,
      'username': username,
      'name': name,
      'folder': folder,
      'cards': cards,
      'resources': resources,
    });
  }

  Future updateSet(
    String setId,
    String name,
    String folder,
    Map cards,
    Map resources,
  ) async {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    final username = user.displayName;
    await db.collection('sets').doc(setId).set({
      'uid': uid,
      'username': username,
      'name': name,
      'folder': folder,
      'cards': cards,
      'resources': resources,
    });
  }

  Future createFolder(String name) async {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    await db.collection('users').doc(uid).update({
      'folders': FieldValue.arrayUnion([name]),
    });
  }

  Future<List<int>> getSetsNumberPerFolder() async {
    final List<int> result = [];
    final List<String> folders = [];
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    final query = await db.collection('users').doc(uid).get();
    query.data()!['folders'].forEach((item) {
      folders.add(item.toString());
    });
    for (final folder in folders) {
      final query = await db
          .collection('sets')
          .where('folder', isEqualTo: folder)
          .where('uid', isEqualTo: uid)
          .get();
      result.add(query.docs.length);
    }
    return result;
  }

  Future<List<String>> getFoldersSuggestion() async {
    final List<String> folders = [];
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    final query = await db.collection('users').doc(uid).get();
    query.data()!['folders'].forEach((item) {
      folders.add(item.toString());
    });
    return folders;
  }

  Future<List<String>> getFolders() async {
    final List<String> folders = [];
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    final query = await db.collection('users').doc(uid).get();
    query.data()!['folders'].forEach((item) {
      folders.add(item.toString());
    });
    return folders;
  }

  Future<Map<dynamic, dynamic>> getSet(String setId) async {
    final db = FirebaseFirestore.instance;
    final query = await db.collection('sets').doc(setId).get();
    return query.data() as Map<dynamic, dynamic>;
  }

  Future<DocumentSnapshot> getUserInfo() async {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    return db.collection('users').doc(uid).get();
  }

  Stream<QuerySnapshot> getRecommendedSetsStream() {
    final db = FirebaseFirestore.instance;
    return db.collection('sets').limit(3).snapshots();
  }

  Stream<QuerySnapshot> getUserSetsStream() {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    return db.collection('sets').where('uid', isEqualTo: uid).snapshots();
  }

  Stream<QuerySnapshot> getSetsInFolderStream(String folder) {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    return db
        .collection('sets')
        .where('uid', isEqualTo: uid)
        .where('folder', isEqualTo: folder)
        .snapshots();
  }

  Stream<QuerySnapshot> findSetsStream(String query) {
    final db = FirebaseFirestore.instance;
    return db
        .collection('sets')
        .where('name', isGreaterThanOrEqualTo: query)
        .snapshots();
  }

  Future<void> addWordToFirestore(Word word) async {
  try {
    await FirebaseFirestore.instance.collection('words').add({
      'id': word.id,
      'term': word.term,
      'definition': word.definition,
    });
    print('Đã thêm từ vào Firestore');
  } catch (e) {
    print('Lỗi khi thêm từ vào Firestore: $e');
  }
}

}
