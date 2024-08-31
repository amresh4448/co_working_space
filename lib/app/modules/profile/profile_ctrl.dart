import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enjoy_co_working_space/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileCtrl extends GetxController {
    final  auth = FirebaseAuth.instance;

    final isLoading = false.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(String name, String email, String address) async {
    isLoading.value = true;
    try {
      await _firestore.collection('users').add({
        'uuid': auth.currentUser!.uid,
        'name': name,
        'email': email,
        'address': address,
      });
      print("User added successfully.");
      Get.toNamed(Routes.HOME);
    } catch (e) {
          isLoading.value = false;

      print("Failed to add user: $e");
    }
  }



  
}