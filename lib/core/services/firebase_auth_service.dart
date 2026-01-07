import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitify/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('هذا الحساب موجود بالفعل. برجاء تسجيل الدخول');
      } else {
        throw CustomException('حدث خطأ ما، برجاء المحاولة لاحقًا');
      }
    } catch (e) {
      throw CustomException('حدث خطأ ما، برجاء المحاولة لاحقًا');
    }
  }
}
