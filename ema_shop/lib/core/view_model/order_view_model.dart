import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ema_shop/helper/local_storage_data.dart';
import 'package:ema_shop/model/order_model.dart';
import 'package:ema_shop/view/control_view.dart';
import 'package:ema_shop/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderViewModel extends GetxController{

 ValueNotifier<bool> get loading=>_loading;
 ValueNotifier<bool> _loading=ValueNotifier(false);
 
  //  final LocalStorageData localStorageData=Get.find<LocalStorageData>();
   
   OrderModel? get orderModel => _orderModel;
   OrderModel? _orderModel;

  @override
  void onInit(){
    super.onInit();
    clearCartAndSaveOrder();
  }
void clearCartAndSaveOrder() async {
  try {
    // حفظ بيانات السلة في Firestore
    String userId = _orderModel!.userId ?? '';
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .get()
        .then((snapshot) async {
      List<Map<String, dynamic>> cartData = [];
      for (DocumentSnapshot doc in snapshot.docs) {
        cartData.add(doc.data() as Map<String, dynamic>);
      }

      // حفظ بيانات السلة في مجموعة وثائق جديدة في Firestore
      await FirebaseFirestore.instance
          .collection('Order')
          .add({'cartData': cartData});

      // نقل المستخدم إلى لوحة التحكم
      // Get.off(()=>HomeView()); // قم بتعديل المسار وفقًا لمسار الصفحة الخاصة بلوحة التحكم
      // ارجع إلى الصفحة الرئيسية أو أي صفحة أخرى بعد حفظ الطلب
    Get.offAll(() => ControlView());
    });
  } catch (error) {
    print('حدث خطأ أثناء تصفية السلة وحفظ البيانات: $error');
  }
}
  // void orderCart() async{
  //   _loading.value=true;
  //   await localStorageData.getUser.then((value){
  //     _orderModel=value;
  //     print(value);
  //   });
  //   _loading.value=false;
  //   update();
  // }

}