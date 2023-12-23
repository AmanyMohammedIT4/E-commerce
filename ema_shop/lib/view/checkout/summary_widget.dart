import 'package:ema_shop/constants.dart';
import 'package:ema_shop/core/view_model/cart_view_model.dart';
import 'package:ema_shop/core/view_model/checkout_view_model.dart';
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder:(controller)=> Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            // SizedBox(height: 20,),
            Container(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=> Container(
                  child:Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          child: Image.network(controller.cartProductModel[index].image!,fit: BoxFit.fitWidth,),
                        ),
                        RichText(
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black
                            ),
                            text: controller.cartProductModel[index].name!),),
                        SizedBox(height: 10,),
                        CustomText(text: '\$${controller.cartProductModel[index].price!.toString()}',color: primaryColor,alignment: Alignment.bottomLeft,),
                    ],),
                  ) ,),
                itemCount:controller.cartProductModel.length,
                separatorBuilder: (context,index){
                  return SizedBox(width: 15,);
                },
                ),
            ),
            CustomText(text: 'Shipping Address',fontSize: 20,),
            GetBuilder<CheckOutViewModel>(
              builder: (controller)=> Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  fontSize: 18,
                  color: Colors.grey,
                  text:'${controller.street1} ,'+ 
                       '${controller.street2},'+ 
                       '${controller.state},'+ 
                       '${controller.city},' +
                       '${controller.country},'),
              ))
          ],
        ),
      ),
    );
  }
}