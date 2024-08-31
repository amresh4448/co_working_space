import 'package:country_code_picker/country_code_picker.dart';
import 'package:enjoy_co_working_space/app/utils/custome_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/custome_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController authController = Get.put(LoginController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(() {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset("assets/images/login.png"),
                  const SizedBox(height: 8),
                  Text(
                    "Login In | Create Account".tr,
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: theme.colorScheme.primary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "hello, Welcome back to Your Account".tr,
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: theme.colorScheme.primary),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Please enter phone number".tr;
                            }
                          },
                          hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          maxLength: 10,
                          controller: authController.phoneController,
                          hintText: "mobile number".tr,
                          textInputType: TextInputType.phone,
                          labelText: "Enter Phone Number".tr,
                          prefix: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: const CountryCodePicker(
                              padding: EdgeInsets.zero,
                              initialSelection: 'IN',
                              favorite: ['+91', 'IN'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                      authController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          onPressed: () {
                           if (_formKey.currentState!.validate()) {
                                 FocusScope.of(context).unfocus(); 
                            authController.verifyPhone(
                                authController.phoneController.text.trim());
                            }
                         
                          },
                          text: 'Send OTP',
                        ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
