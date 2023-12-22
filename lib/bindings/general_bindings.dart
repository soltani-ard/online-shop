import 'package:get/get.dart';
import 'package:online_shop/utils/device/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}