
import 'package:ema_shop/core/view_model/auth_view_model.dart';
import 'package:ema_shop/view/auth/login_screen.dart';
import 'package:ema_shop/view/widgets/custom_button.dart';
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:ema_shop/view/widgets/form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel>{
    final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
    
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap:(){
            Get.off(()=>LoginScreen());
          },
          child:Icon(Icons.arrow_back,color: Colors.black,) ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomText(text:'Sign Up',fontSize: 30 ,),
                  SizedBox(height: 10,),
                  FormTextF(
                    onSaved: (value){
                      controller.name=value;
                    },
                    messReturn: 'Error validator email', 
                    labelText: 'Name',),
                  // CustomTextFormField(
                  // text: 'Name',
                  // hint: "name",
                  // onSaved: (value){
                  //   controller.name=value;
                  // },
                  // validator: (value){
                  //   if(value==null){
                  //     print("error validator email");
                  //   }
                  // },),
                   SizedBox(height: 30,),
                    FormTextEmail(
                    onSaved:  (value){
                    controller.email=value;
                  },),
                //  CustomTextFormField(
                //   text: 'Email',
                //   hint: "email",
                //   onSaved: (value){
                //     controller.email=value;
                //   },
                //   validator: (value){
                //     if(value==null){
                //       print("error validator email");
                //     }
                //   },),
                   SizedBox(height: 30,),
                   FormTextPassword(
                   onSaved: (value){
                    controller.password=value;
                    },
                    labelText:  'Password', 
                    messReturn: 'Please enter password',),

                  //  CustomTextFormField(
                  // text: 'Password',
                  // hint: "********",
                  // onSaved: (value){
                  //   controller.password=value;
                  // },
                  // validator: (value){
                  //    if(value==null){
                  //     print("error validator password");
                  //   }
                  // },),
                  SizedBox(height: 20,),
                  // FormTextPassword(
                  //   onSaved: (value){
                  //   controller.confirmPassword=value;
                  //   },
                  //   messReturn: 'Please confirm password', 
                  //   labelText: 'Confirm Password',),
              
                  CustomButton(text: 'SIGN Up',onPressed: (){
                    _formKey.currentState!.save();
                    if(_formKey.currentState!.validate()){
                    controller.CreateAccountWithEmailAndPassword();
                    }
                  },),
                  SizedBox(height: 10,),
                
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
 
  }
}