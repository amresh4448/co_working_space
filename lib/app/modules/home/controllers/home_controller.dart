import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
    final  auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var users = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
     fetchUsers();
  }

  RxBool switchValue = false.obs;
  void changeSwitch(value) {
    switchValue = value;
  }

  void fetchUsers() async {
    try {
      isLoading.value = true;
      final snapshot = await _firestore.collection('users').where("uuid", isEqualTo: auth.currentUser!.uid).get();
      users.value = snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("Failed to fetch users: $e");
    } finally {
      isLoading.value = false;
    }
  }
}