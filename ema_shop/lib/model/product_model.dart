import 'package:ema_shop/helper/extention.dart';
import 'package:flutter/animation.dart';

class ProductModel{
  String? productId, name,image,description,sized,price;
  Color? color;
  ProductModel({this.productId,this.color,this.description,this.image,this.name,this.price,this.sized});

  ProductModel.fromJson(Map<dynamic,dynamic> map){
    if(map==null){
      return;
    }
    name=map['name'];
    image=map['image'];
    description=map['description'];
    color=HexColor.fromHex(map['color']);
    sized=map['sized'];
    price=map['price'];
    productId=map['productId'];
  }

  toJson(){
    return{
      'name':name,
      'image':image,
      'description':description,
      'color':color,
      'sized':sized,
      'price':price,
      'productId':productId
    };
  }
}