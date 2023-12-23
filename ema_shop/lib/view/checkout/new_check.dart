
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckOutView extends StatefulWidget {

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int currentStep=0;
  continueStep(){
    if(currentStep < 2){
      setState(() {
      currentStep=currentStep+1;
    });
    }
  }
  cancelStep(){
    if(currentStep >0){
      setState(() {
        currentStep =currentStep -1;
      });
    }
  }
  onStepTapped(int value){
    setState(() {
      currentStep =value;
    });
  }
 Widget controlsBuilder(Context , details){
    return Row(
      children: [
        ElevatedButton(
          onPressed: details.onStepContinue,
          child:const CustomText(text: 'Next',)),
          SizedBox(width: 10,),
        OutlinedButton(
          onPressed: details.onStepCancel ,
          child: const CustomText(text: 'back',))
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        margin: const EdgeInsets.all(100),
        physics: const ClampingScrollPhysics(),
        type: StepperType.horizontal,
        elevation: 0,
        currentStep: currentStep,
        onStepContinue: continueStep,
        onStepCancel: cancelStep,
        onStepTapped: onStepTapped,
        controlsBuilder:controlsBuilder ,
        steps: [
        Step(
          title:const CustomText(text: 'Step 1',),
          //you can add colum
          content: const CustomText(text: 'This is the first step',),
          isActive: currentStep>=0,
          state:currentStep>=0 ? StepState.complete : StepState.disabled,
          ),
         Step(
          title:const CustomText(text: 'Step 2',),
          content: const CustomText(text: 'This is the 2 step',),
          isActive: currentStep>=1,
          state:currentStep>=1 ? StepState.complete : StepState.disabled,
          ),
           Step(
          title:const CustomText(text: 'Step 3',),
          content:const  CustomText(text: 'This is the 3 step',),
          isActive: currentStep>=2,
          state:currentStep>=2 ? StepState.complete : StepState.disabled,
          ),
      ]),
    );
  }
}
