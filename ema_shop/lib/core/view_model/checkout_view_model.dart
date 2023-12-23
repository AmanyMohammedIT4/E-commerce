
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ema_shop/helper/enum.dart';
import 'package:ema_shop/model/order_model.dart';
import 'package:ema_shop/model/product_model.dart';
import 'package:ema_shop/view/control_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CheckOutViewModel extends GetxController{

  int get currentStep =>_currentStep;
  int _currentStep=0;

    Pages get pages => _pages;
    Pages _pages = Pages.deliveryTime;

  String? street1,street2,city,state,country;
  GlobalKey<FormState> formState =GlobalKey();

   OrderModel? get orderModel => _orderModel;
   OrderModel? _orderModel;
   
void changeIndex(int i){
  if(i == 0 || i < 0){
    _pages = Pages.deliveryTime;
    _currentStep = i;
  } else if(i == 1){
    _pages = Pages.addAddress;
    _currentStep = i;
  } else if(i == 2){
    if(formState.currentState != null){
      if(formState.currentState!.validate()){
        formState.currentState!.save();
        _pages = Pages.summary;
        _currentStep = i;
      } else {
        // عرض رسالة تنبيه للمستخدم بضرورة ملء الحقول
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Please fill in all fields')),
        );
      }
    }
  } else if(i == 3){
    Get.to(() => ControlView());
    _pages = Pages.deliveryTime;
    _currentStep = 0;
  }
  update();
}

void addToFirestore(String userId, DateTime date,List<ProductModel> products,Address address) async {
   
   try {
    final CollectionReference collection = FirebaseFirestore.instance.collection('Order');
    await collection.add({
      'Products': products,
      'address': address,
      'dateTime': date,
      'userId': userId,
    });
     update();
     print('تمت عملية الإضافة إلى Firestore بنجاح');
     
  } catch (e) {
    print('حدث خطأ: $e');
  } 

}

}




