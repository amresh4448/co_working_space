import 'package:enjoy_co_working_space/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final homec = Get.put(HomeController());
  final HomeController userController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(100, 90),
        child: AppBar(
          elevation: 0,
          title: const Text('Enjoy Co Working Space'),
          centerTitle: true,
          actions:  [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: CircleAvatar(
                radius: 50,
                child: IconButton(onPressed: () async {
      try {
        await FirebaseAuth.instance.signOut();
        Get.toNamed(Routes.LOGIN);
      } catch (error) {
        print("Sign-out error: $error");
      }
    },
                
                
                icon: const Icon(Icons.logout)),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Container(
                padding: const EdgeInsets.all(12),
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:   Obx(() {
                          if (userController.isLoading.value) {
                            return const Center(child: CircularProgressIndicator());
                          }
                  
                          if (userController.users.isEmpty) {
                            return const Center(child: Text('No users found.'));
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: userController.users.length,
                            itemBuilder: (context, index) {
                              final user = userController.users[index];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [

                                  const Center(child:  Text("User Details",style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                               Text(user['name'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),),
                          
                               Text('${user['email']} ',style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),),

                               Text('${user['address']} ',style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),),

                                ],
                              );
                              
                              
                              
                            
                              
                            },
                          );
                        }),
                  
                  ),
            ),

                 

          ],
        ),
      ),
    );
  }
}





