import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../profile/profile.dart';

class SplashController extends GetxController {
    final  auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;




@override
void onInit() {
  super.onInit();

  if (auth.currentUser != null) {
    Future.delayed(const Duration(milliseconds: 500), () {
      firestore
          .collection('users').where('uuid', isEqualTo: auth.currentUser!.uid)

          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.to(() => Profile());
        }
      }).catchError((error) {
        Get.offAllNamed(Routes.LOGIN);
      });
    });
  } else {
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.offAllNamed(Routes.LOGIN);
    });
  }
}

  @override
  void onClose() {
    super.onClose();
  }

}
