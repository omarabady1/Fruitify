import 'database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<bool> checkIfValueExist(
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
}
