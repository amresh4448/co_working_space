import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/custome_button.dart';
import '../../utils/custome_text_filed.dart';
import 'profile_ctrl.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  TextEditingController nameCtrl = TextEditingController();
    TextEditingController emailCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  final ProfileCtrl profileCtrl = Get.put(ProfileCtrl());


  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("User Information"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _key,
            child: Obx((){
              return   Column(
              children: [
              Image.asset("assets/images/signup.png"),
                            const SizedBox(height: 16,),

                CustomTextFormField(
                  hintStyle:
                      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  controller: nameCtrl,
                  hintText: "amresh kumar".tr,
                  textInputType: TextInputType.text,
                  labelText: "Enter Your Name ".tr,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'please Enter your Name';
                    }
                  },
                ),
                const SizedBox(height: 16,),
            
                CustomTextFormField(
                  hintStyle:
                      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
             
                  controller: emailCtrl,
                  hintText: "abc123@gmail.com".tr,
                  textInputType: TextInputType.emailAddress,
                  labelText: "Enter your Email ".tr,
                       validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'please Enter your Email';
                    }
                  },
                ),
              const SizedBox(height: 16,),
            
                CustomTextFormField(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                maxLines: 2,
                  hintStyle:
                      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
             
                  controller: addressCtrl,
                  hintText: "abc mumbai".tr,
                  textInputType: TextInputType.streetAddress,
                  labelText: "Enter your address".tr,
                               validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'please Enter your address';
                    }
                  },
                ),
              const SizedBox(height: 30,),
            
               profileCtrl.isLoading.value ? const CircularProgressIndicator() : 
                CustomButton(
                        text: 'Save', 
                        onPressed: () {
                          if(_key.currentState!.validate()){
                      profileCtrl.addUser(nameCtrl.text, emailCtrl.text, addressCtrl.text);

                          }
                       
                       
                        },
                       
                      )
              ],
            );
        
        
            })
            
           
        
          ),
        ),
      ),
    );
  }
}
