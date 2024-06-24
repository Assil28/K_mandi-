import 'package:get/get.dart';
import 'package:k_mandi/core/class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
   Get.put(Crud());
  }
  
}