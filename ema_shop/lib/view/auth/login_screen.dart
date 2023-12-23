import 'package:ema_shop/constants.dart';
import 'package:ema_shop/core/view_model/auth_view_model.dart';
import 'package:ema_shop/view/auth/register_screen.dart';
import 'package:ema_shop/view/widgets/custom_button.dart';
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:ema_shop/view/widgets/form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel>{
  // const LoginScreen({super.key});
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text:'Welcome',fontSize: 30 ,),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>RegisterView());
                        },
                        child: CustomText(text:'Sign Up',fontSize: 18 ,color: primaryColor)),
                    ],
                  ),
                  SizedBox(height: 10,),

                  CustomText(text:'Sign in to Continue',fontSize: 14 ,color: Colors.grey),

                  SizedBox(height: 20,),
                  FormTextEmail(
                    onSaved:  (value){
                    controller.email=value;
                  },),
                
                FormTextPassword(
                  onSaved: (value){
                    controller.password=value;
                  },
                  labelText:  'Password', 
                  messReturn: 'Please enter password',),

                   SizedBox(height: 20,),
                  // CustomText(text:'Forget Password',fontSize: 14,alignment: Alignment.topRight,),
                  // SizedBox(height: 20,),
                  CustomButton(text: 'SIGN IN',onPressed: (){
                    _formKey.currentState!.save();
                    if(_formKey.currentState!.validate()){
                    controller.sinInWithEmailAndPassword();
                    }
                  },),
                  SizedBox(height: 10,),
                  CustomText(text:'-OR-',alignment: Alignment.center,),
                  SizedBox(height: 10,),
                   CustomButtonWithIcon(
                    text: 'Sign In With Google',
                    onTap: (){
                      controller.googleSignInMethod();
                    },
                    color: Color(0xffdb3236),
                    iconData: FontAwesomeIcons.googlePlusG,
                    ),
                    SizedBox(height: 20,),
                     CustomButtonWithIcon(
                    text: 'Sign In With Facebook',
                    onTap: (){
                      controller.facebookSignInMethod();
                    },
                    color: Color(0xff4267B2),
                    iconData: FontAwesomeIcons.facebookF,
                    ),
                    SizedBox(height: 20,),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
 
  }
}