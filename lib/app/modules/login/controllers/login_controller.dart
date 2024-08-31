import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../routes/app_pages.dart';
import '../../profile/profile.dart';


class LoginController extends GetxController {
  
  final  auth = FirebaseAuth.instance;
  var verificationId = ''.obs;
  var isLoggedIn = false.obs;
    final isLoading = false.obs;
  TextEditingController otpController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
void verifyPhone(String phoneNumber) async {
  isLoading.value = true;

  if (!phoneNumber.startsWith('+91')) {
    if (phoneNumber.startsWith('91')) {
      phoneNumber = '+$phoneNumber';
    } else {
      phoneNumber = '+91$phoneNumber';
    }
  }

  try {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        isLoggedIn.value = true;
        isLoading.value = false;
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Error: ${e.message}");
        Get.snackbar("Error", e.message ?? "Verification failed");
        isLoading.value = false; 
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        isLoading.value = false; 
        Get.toNamed(Routes.VERIFYOTP);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
        isLoading.value = false; 
      },
    );
  } catch (e) {
    isLoading.value = false;
    Get.snackbar("Error", "An unexpected error occurred.");
  }
}

void signInWithOTP(String smsCode) async {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId.value,
      smsCode: smsCode,
    );
    UserCredential userCredential = await auth.signInWithCredential(credential);
    if (userCredential.user != null) {
      checkStatus();
      print("resultUser ${userCredential.user!.uid}");
      isLoggedIn.value = true;
    } else {
      throw Exception("User not found");
    }
  } catch (e) {
    Get.snackbar("Error", "Failed to sign in: $e");
  }
}

void checkStatus() async {
    if (auth.currentUser != null) {
    Future.delayed(const Duration(milliseconds: 500), () {
      firestore
          .collection('users')
          .where('uuid', isEqualTo: auth.currentUser!.uid)
          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.to(() => Profile());
        }
      }).catchError((error) {
        print("catchErrorcatchError $error");
        Get.offAllNamed(Routes.LOGIN);
      });
    });
  } else {
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.offAllNamed(Routes.LOGIN);
    });
  }
}




}


