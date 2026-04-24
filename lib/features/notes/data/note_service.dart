import 'package:cloud_firestore/cloud_firestore.dart';

class NoteService {
  final _db = FirebaseFirestore.instance;

  Future<void> addNote(String title, String desc, String uid) async {
    await _db.collection("notes").add({
      "title": title,
      "description": desc,
      "userId": uid,
    });
  }

  Future<void> deleteNote(String docId) async {
    await FirebaseFirestore.instance.collection("notes").doc(docId).delete();
  }

  Stream<QuerySnapshot> getNodes(String uid) {
    return _db.collection("notes").where("userId", isEqualTo: uid).snapshots();
  }
}
