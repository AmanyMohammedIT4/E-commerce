import 'package:ema_shop/core/view_model/checkout_view_model.dart';
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:ema_shop/view/widgets/form_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find<CheckOutViewModel>(),
      builder:(controller)=> Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SizedBox(height: 20,),
                  CustomText(text: 'Billing address is the same ad delivery address',fontSize: 20,alignment: Alignment.center,),
                      
                  SizedBox(height: 30,),
                  FormTextF(
                    onSaved: (value){
                      controller.street1=value;
                    },
                    messReturn: 'You must write your street', 
                    labelText: 'Street 1',
                    hintText: '21, Alex Davidson Avenue',),
                  SizedBox(height: 10,),
                  FormTextF(
                    onSaved: (value){
                      controller.street2=value;
                    },
                    messReturn: 'You must write your street', 
                    labelText: 'Street 2',
                    hintText: 'Opposite Omegatron, Vicent Quarters',),
                  SizedBox(height: 10,),
                  FormTextF(
                    onSaved: (value){
                      controller.city=value;
                    },
                    messReturn: 'You must write your street', 
                    labelText: 'City',
                    hintText: 'Victoria Island',),
                  SizedBox(height: 10,),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child:
                          FormTextF(
                            onSaved: (value){
                              controller.state=value;
                            },
                            messReturn: 'You must write your state', 
                            labelText: 'State',
                            hintText: 'Lagos State',),
                        )),
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: FormTextF(
                            onSaved: (value){
                              controller.country=value;
                            },
                            messReturn: 'You must write your Country', 
                            labelText: 'Country',
                            hintText: 'Nigeria',),
                        )),
                      ],
                    ),
                  )
                      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}