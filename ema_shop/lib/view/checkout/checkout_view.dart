
import 'package:ema_shop/constants.dart';
import 'package:ema_shop/core/view_model/checkout_view_model.dart';
import 'package:ema_shop/view/checkout/add_address_widget.dart';
import 'package:ema_shop/view/checkout/delevery_time_widget.dart';
import 'package:ema_shop/view/checkout/summary_widget.dart';
import 'package:ema_shop/view/widgets/custom_button.dart';
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CheckOutView extends StatelessWidget {
  // final MyStepController controller = Get.put(MyStepController());
 Widget controlsBuilder(Context , details){
    return GetBuilder<CheckOutViewModel>(
       builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               controller.currentStep == 0 ? Container() : Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: 150,
                    height: 100,
                    child: CustomButton(
                      onPressed: (){
                      controller.changeIndex(controller.currentStep - 1);
                    }, 
                    color: Colors.white,
                    textColor: primaryColor,
                    text: 'Back'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: 150,
                    height: 100,
                    child: CustomButton(
                      onPressed: () {
                        controller.changeIndex(controller.currentStep+1);
                        // if()
                        },
                     text: 'NEXT'),
                  ),
                ),
              ],
            ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            "CheckOut",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      body: 
      GetBuilder<CheckOutViewModel>(
        builder: (controller) =>
          Column(
            children: [
              Expanded(
                child: Stepper(
                  connectorColor:  MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return primaryColor; // لون الخطوة الحالية
                        }
                        return Colors.grey; // لون الخطوات الأخرى
                      },
                    ),
                  margin: const EdgeInsets.all(100),
                  physics: const ClampingScrollPhysics(),
                  type: StepperType.horizontal,
                  elevation: 0,
                  currentStep: controller.currentStep,
                  onStepContinue: null,
                  steps: [
                    Step(
                      title:const CustomText(text: '',),
                      //you can add colum
                      content: DeliveryTime(),
                      //const CustomText(text: 'This is the first step',),
                      isActive:controller.currentStep>=0,
                      state:controller.currentStep>=0 ? StepState.complete : StepState.disabled,
                      ),
                    Step(
                      title:const CustomText(text: '',),
                      content: AddAddress(),
                      isActive:controller.currentStep>=1,
                      state:controller.currentStep>=1 ? StepState.complete : StepState.disabled,
                      ),
                      Step(
                      title:const CustomText(text: '',),
                      content:Summary(),
                      isActive:controller.currentStep>=2,
                      state:controller.currentStep>=2 ? StepState.complete : StepState.disabled,
                      ),
                  ],
                  controlsBuilder: controlsBuilder,
                 
                ),
              ),
               
            ],
          )));
        }
    }
  
