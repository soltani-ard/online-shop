import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  bool active;
  String imgUrl;
  String targetScreen;

  BannerModel(
      {required this.imgUrl, required this.active, required this.targetScreen});

  Map<String, dynamic> toJson() {
    return {
      'imgUrl': imgUrl,
      'active': active,
      'targetScreen': targetScreen,
    };
  }

  // map json from firebase to BannerModel
  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    // map json record to the model
    return BannerModel(
      imgUrl: data['imgUrl'] ?? '',
      active: data['active'] ?? false,
      targetScreen: data['targetScreen'] ?? '',
    );
  }
}
