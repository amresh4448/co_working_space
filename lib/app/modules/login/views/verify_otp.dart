import 'package:enjoy_co_working_space/app/utils/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../controllers/login_controller.dart';

class VerfiyOtp extends GetView<LoginController> {
  VerfiyOtp({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Verify OTP"),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/login.png"),
                const Padding(
                  padding: EdgeInsets.zero,
                  child: Text(
                    "Verification",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "+91 ${controller.phoneController.text}",
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "We have sent a 6-digit verification code to your phone number. Please enter the code below to verify it's you.",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Pinput(
                    errorText: "Please enter OTP",
                    errorTextStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.red,
                    ),
                    length: 6,
                    controller: controller.otpController,
                    textInputAction: TextInputAction.done,
                    mainAxisAlignment: MainAxisAlignment.center,
                    disabledPinTheme: PinTheme(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Colors.black45,
                      ),
                      padding: const EdgeInsets.only(left: 9, right: 9),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a valid code";
                      }
                      if (value.length != 6) {
                        return "Please enter a 6-digit code";
                      }
                      return null;
                    },
                    errorPinTheme: PinTheme(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      textStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      width: 60,
                      height: 60,
                    ),
                    defaultPinTheme: PinTheme(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      width: 60,
                      height: 60,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("I didn't get the code  "),
                    InkWell(
                      onTap: () {
                        // Add your resend logic here
                      },
                      child: const Text(
                        "Resend Code",
                        style: TextStyle(
                          color: Color(0xFF70BB76),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(() => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        width: 350,
                        text: 'Verify OTP',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final otp = controller.otpController.text.trim();
                            controller.signInWithOTP(otp);
                          } else {
                            Get.snackbar("Error", "Please enter a valid 6-digit OTP");
                          }
                        },
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
