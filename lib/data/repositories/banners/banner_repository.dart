
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_shop/features/shop/models/banner_model.dart';
import 'package:online_shop/utils/exceptions/firebase_exceptions.dart';
import 'package:online_shop/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  // get all banners
  Future<List<BannerModel>> getAllBanners() async {
    try {
      final snapshot = await _db
          .collection('Banners')
          .where('active', isEqualTo: true)
          .get();
      final list = snapshot.docs
          .map((document) => BannerModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again.\n ${e.toString()}';
    }
  }
}
