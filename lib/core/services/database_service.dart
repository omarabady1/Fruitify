abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<bool> checkIfValueExist(String collection,String field, String value);
}
