import 'package:ema_shop/core/services/home_service.dart';
import 'package:ema_shop/model/best_selling_product_model.dart';
import 'package:ema_shop/model/category_model.dart';
import 'package:ema_shop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
  //for the loading of data 
  ValueNotifier<bool>get loading=>_loading;
  ValueNotifier<bool> _loading=ValueNotifier(false);

  List<CategoryModel> get categoryModel=> _categoryModel;
  List<CategoryModel> _categoryModel=[];

  List<ProductModel> get productModel=> _productModel;
  List<ProductModel> _productModel=[];

  List<BestSellingProductModel>get bestproductModel=> _bestproductModel;
  List<BestSellingProductModel> _bestproductModel=[];

  String searchText='';

HomeViewModel(){
  getCategory();
  getBestSellingProducts();
  getProducts();
}

  getCategory()async{
    _loading.value=true;
 HomeService().getCategory().then((value){
      // print(value.docs[0].data());
      for(int i=0; i<value.length ; i++){
        // var data = value[i].data() as Map<dynamic, dynamic>;
        // _categoryModel.add(CategoryModel.fromJson(data));
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        _loading.value=false;
      }
      update();
    });
  }

//   getBestSellingProducts() async{
// HomeService().getBestSelling().then((value){
      
//       for(int i=0; i<value.length ; i++){
//         _productModel.add(ProductModel.fromJson(value[i].data()));
//         _loading.value=false;
//         // print(_productModel.length);
//       }
//       update();
//       });
//   }
    getBestSellingProducts() async{
HomeService().getBestSelling().then((value){
      
      for(int i=0; i<value.length ; i++){
        _bestproductModel.add(BestSellingProductModel.fromJson(value[i].data()));
        _loading.value=false;
        // print(_productModel.length);
      }
      update();
      });
  }

      getProducts() async{
    HomeService().getProducts().then((value){
      
      for(int i=0; i<value.length ; i++){
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value=false;
      }
      update();
      });
  }
   // تحديث قيمة searchText
  void updateSearchText(String value) {
    searchText = value;
    update(); // تحديث الواجهة الرسومية بعد تغيير القيمة
  }
}