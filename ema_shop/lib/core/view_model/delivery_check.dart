 import 'package:ema_shop/constants.dart';
import 'package:ema_shop/helper/enum.dart';
import 'package:ema_shop/view/control_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryCheck extends GetxController{

  int get index =>_index;
  int _index=0;

    Pages get pages => _pages;
    Pages _pages = Pages.deliveryTime;

  String? street1,street2,city,state,country;
  GlobalKey<FormState> formState =GlobalKey();

void changeIndex(int i){
  if(i==0 || i<0){
    _pages= Pages.deliveryTime;
    _index=i;
  }else if(i ==1){
    _pages=Pages.addAddress;
    _index=i;
  }
  else if(i == 2){
    formState.currentState!.save();
    if(formState.currentState!.validate()){
    _pages=Pages.summary;
    _index=i;
    }
  }
  else if(i == 3){
    Get.to(()=>ControlView());
    _pages= Pages.deliveryTime;
    _index=0;
  }
  update();
}

    Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.teal;
    } else {
      return todoColor;
    }
  }

}