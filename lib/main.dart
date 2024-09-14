import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( 
      options: const FirebaseOptions( 
          apiKey: "", 
          authDomain: "testproject-e564a.firebaseapp.com", 
          projectId: "testproject-e564a", 
          storageBucket: "testproject-e564a.appspot.com", 
          messagingSenderId: "", 
          appId: "1:843881887238:android:840ad0503c4f6304197587", 
          measurementId: "") 
  ); 
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

