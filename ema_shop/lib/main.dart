import 'package:ema_shop/core/view_model/cart_view_model.dart';
import 'package:ema_shop/core/view_model/order_view_model.dart';
import 'package:ema_shop/helper/binding.dart';
import 'package:ema_shop/helper/local_storage_data.dart';
import 'package:ema_shop/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   Get.put(CartViewModel());
   Get.put(OrderViewModel());
   Get.put(ControlView());
   Get.put(LocalStorageData());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: ControlView(),
      ),
      theme: ThemeData(
        // fontFamily: 'SourceCode'
      ),
    );
  }
}
