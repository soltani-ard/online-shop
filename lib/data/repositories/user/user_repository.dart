import 'package:get/get.dart';
import 'package:online_shop/features/authentication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// function to save user data in FireStore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'Something went wrong, Please try again.';
    }
  }
}
