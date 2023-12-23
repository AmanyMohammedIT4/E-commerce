import 'package:ema_shop/model/category_model.dart';
import 'package:ema_shop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryViewModel extends GetxController{

  ValueNotifier<bool> get loading=>_loading;
  ValueNotifier<bool> _loading=ValueNotifier(false);

  List<CategoryModel> get categoryModel=>_categoryModel;
  List<CategoryModel> _categoryModel=[];

  List<ProductModel> get productModel=> _productModel;
  List<ProductModel> _productModel=[];

  CategoryViewModel(){

  }

  getCategoryDetails()async{
    
  }
  
}