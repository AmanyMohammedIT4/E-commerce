import 'package:ema_shop/constants.dart';
import 'package:ema_shop/core/view_model/cart_view_model.dart';
import 'package:ema_shop/view/checkout/checkout_view.dart';
import 'package:ema_shop/view/widgets/custom_button.dart';
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:9),
        child:  GetBuilder<CartViewModel>(
           init:Get.find<CartViewModel>() ,
          builder:(controller)=> controller.cartProductModel.length == 0 
                ?
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/emptyCart.svg',width: 200,height: 200,),
                      SizedBox(height: 20,),
                      CustomText(text: 'Cart Empty',fontSize: 30,alignment: Alignment.topCenter,),
                    ],
                  ),
                )
                : Column(
            children: [
              Expanded(
                child: Container(
                    child: ListView.separated(
                      itemBuilder: (context,index){
                        return Container(
                          height: 140,
                          child: Row(
                            children: [
                              Container(
                                width: 140,
                                child: Image.network(controller.cartProductModel[index].image!,fit: BoxFit.fill,)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(text: controller.cartProductModel[index].name!,fontSize: 10,maxLine: 1,),
                                      SizedBox(height: 8,),
                                      CustomText(text: '\$${controller.cartProductModel[index].price!.toString()}',color: primaryColor,),
                                      SizedBox(height: 15,),
                                      Container(
                                        width: 140,
                                        height: 40,
                                        color: Colors.grey.shade200,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              child: Icon(Icons.add,color: Colors.black,),
                                              onTap: (){
                                                controller.increaseQuantity(index);
                                              },),
                                            SizedBox(width: 20,),
                                            CustomText(
                                              text:controller.cartProductModel[index].quantity.toString(),
                                              alignment: Alignment.center,
                                              fontSize: 20,
                                              color: Colors.black,),
                                            SizedBox(width: 20,),
                                            GestureDetector(
                                              onTap: (){
                                                controller.decreaseQuantity(index);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.only(bottom: 20),
                                                child: Icon(Icons.minimize,color: Colors.black,)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          ],),
                        );
                      },
                      itemCount: controller.cartProductModel.length,
                      separatorBuilder: (BuildContext context,int index){
                        return SizedBox(
                          height: 10,
                        );
                      },
                      ),
                      
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(children: [
                    CustomText(text:'Total',fontSize: 22,color: Colors.grey,),
                    SizedBox(height: 5,),
                    GetBuilder<CartViewModel>(
                      init: Get.find<CartViewModel>(),
                      builder:(controller)=>
                       CustomText(text:'\$${controller.totalPrice}',fontSize: 18,color: primaryColor,)),
                  ],),
                  Container(
                    width: 122,
                    height: 55,
                    child: CustomButton(onPressed: (){
                      Get.to(()=>CheckOutView());
                      print('Check out');
                    }, 
                    text: 'CHECKOUT')),
                ],),
              )
            ],
          ),
        ),
      ),
    ));
  }
}