import 'database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId != null) {
      await firestore.collection(path).doc(docId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> checkIfValueExists(
    String collection,
    String field,
    String value,
  ) async {
    final result = await FirebaseFirestore.instance
        .collection(collection)
        .where(field, isEqualTo: value)
        .limit(1)
        .get();

    return result.docs.isNotEmpty;
  }

  @override
  Future<dynamic> getData({required String path, String? docId}) async {
    if (docId != null) {
      var data = await firestore.collection(path).doc(docId).get();
      return data.data();
    } else {
      var data = await firestore.collection(path).get();
      return data.docs.map((e) => e.data()).toList();
    }
  }
}
