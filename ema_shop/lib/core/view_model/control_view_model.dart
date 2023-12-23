
import 'package:ema_shop/view/cart_view.dart';
import 'package:ema_shop/view/home_view.dart';
import 'package:ema_shop/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController{
  int _navigatorValue=0;

  get navigatorValue => _navigatorValue;

  Widget _currentScree =HomeView();
  get currentScree => _currentScree;
  
  void changesSelectedValue(int selectedValue){
    _navigatorValue=selectedValue;
    switch(selectedValue){
          case 0:{
            _currentScree = HomeView();
            break;
          }
          case 1:{
            _currentScree =CartView();
            break;
          }
          case 2:{
            _currentScree =ProfileView();
          }
        }
    update();
  }
}