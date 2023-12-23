

import 'package:ema_shop/core/view_model/auth_view_model.dart';
import 'package:ema_shop/core/view_model/control_view_model.dart';
import 'package:ema_shop/view/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel>{
  @override
  Widget build(BuildContext context){
    return Obx((){
      return (Get.find<AuthViewModel>().user == null)
      ? LoginScreen()
      : GetBuilder<ControlViewModel>(
        init: ControlViewModel(),
        builder:(controller)=> Scaffold(
        body:controller.currentScree,bottomNavigationBar: bottomNavigatonBar(),));
    });
  }
}

  Widget bottomNavigatonBar() {
  return GetBuilder<ControlViewModel>(
    init: Get.find<ControlViewModel>(),
    builder: (controller) => 
     BottomNavigationBar(
      currentIndex: controller.navigatorValue,
      onTap: (index){
        controller.changesSelectedValue(index);
      },
      elevation: 0,
      selectedItemColor: Colors.black,
      backgroundColor: Colors.grey.shade50,
      items: [
      BottomNavigationBarItem(
        activeIcon: Padding(
          padding: const EdgeInsets.only(top:15.0),
          child: Text("Explore"),
        ),
        label: "",
        icon: Image.asset('assets/images/explorIcon.png',fit: BoxFit.contain,width: 20,),
      ),
      BottomNavigationBarItem(
        activeIcon: Text("Cart"),
        label: "",
        icon: Image.asset('assets/images/cartIcon.png',fit: BoxFit.contain,width: 30,),
      ),
      BottomNavigationBarItem(
        activeIcon: Text("Account"),
        label: "",
        icon: Image.asset('assets/images/personIcon.png',fit: BoxFit.contain,width: 19,),
      ),
      
    ]),
  );
}


