import 'package:ema_shop/constants.dart';
import 'package:ema_shop/core/view_model/cart_view_model.dart';
import 'package:ema_shop/model/cart_product_model.dart';
import 'package:ema_shop/model/product_model.dart';
import 'package:ema_shop/view/widgets/custom_button.dart';
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel? model;
  
   DetailsView({ this.model });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Image.network(model!.image!,fit: BoxFit.fill,)),
                  SizedBox(height: 15,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: model!.name!,
                          fontSize: 26,),
                          SizedBox(height: 15,),
                        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.all(13),
                                width: MediaQuery.of(context).size.width * .4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomText(text:'Size'),
                                    CustomText(text:model!.sized!),
                                  ],
                                ),
                              ),
                               Container(
                                padding: EdgeInsets.all(13),
                                width: MediaQuery.of(context).size.width * .4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomText(text:'Color'),
                                    Container(
                                      width: 30,
                                      height: 20,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(20),
                                        color: model!.color
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          
                          SizedBox(height: 15,),
                          CustomText(text: 'Details',
                          fontSize: 18,),
                        
                          SizedBox(height: 5,),
                          CustomText(text: model!.description!,
                          fontSize: 15,
                          height: 2.5,),
                        ],
                                        ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(text: 'PRICE',fontSize: 18,color: Colors.grey,),
                            CustomText(text: '\$${model!.price!}',fontSize: 18,color: primaryColor,),
                          ],
                        ),
                        GetBuilder<CartViewModel>(
                          init: CartViewModel(),
                          builder:(controller)=> Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 100,
                              height: 55,
                              child: CustomButton(
                                onPressed: () { 
                                  controller.addProduct(
                                    CartProductModel(
                                      name: model!.name,
                                      image: model!.image,
                                      price: model!.price,
                                      quantity: 1,
                                      productId: model!.productId
                                    ),
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Added Sucessfully'),
                                    )),
                                  );
                                 },
                                text: 'Add',)),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
      ),
    );
  }
 

}