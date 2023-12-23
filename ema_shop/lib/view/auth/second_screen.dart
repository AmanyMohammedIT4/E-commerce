import 'package:ema_shop/core/view_model/auth_view_model.dart';
import 'package:ema_shop/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<AuthViewModel>(
          init: AuthViewModel(),
        builder:(value)=> ElevatedButton(onPressed: (){
          Get.to(()=>LoginScreen());
        }, child: Text("Logout")))),
    );
  }
}