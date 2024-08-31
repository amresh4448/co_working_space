import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView({super.key});
  final splashC = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Co-Working Space',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
