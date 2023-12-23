import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormTextEmail extends StatelessWidget {
  const FormTextEmail({super.key, this.onSaved});

// final TextEditingController? emailController;
 final ValueSetter? onSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 10.0,),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.black26,fontSize: 15),
              ),
              // controller: emailController,
               onSaved:onSaved,
              validator: (value){
                if(value==null || value.isEmpty){
                  return 'Please enter email';
                }
                else if(!value.contains('@')){
                  return 'Please enter valid email';
                }
                return null;
              },
            ),
          ),
    );
  }
}

class FormTextF extends StatelessWidget {
  const FormTextF({super.key,required this.labelText, required this.messReturn, this.hintText, this.onSaved});
  // final TextEditingController? passwordController;
final String? labelText;
final String? messReturn;
final String? hintText;
 final ValueSetter? onSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  labelText: labelText,
                  hintText:hintText ,
                  labelStyle: TextStyle(
                    fontSize: 10.0,),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.black26,fontSize: 15),
                ),
                // controller: passwordController,
                onSaved: onSaved,
                validator: ( value){
                  if(value==null || value.isEmpty){
                    return messReturn;
                  }
                  return null;
                },
              ),
            ),
          );
  }
}

class FormTextPassword extends StatelessWidget {
  const FormTextPassword({super.key,required this.labelText, required this.messReturn, this.hintText, this.onSaved});
  // final TextEditingController? passwordController;
final String? labelText;
final String? messReturn;
final String? hintText;
 final ValueSetter? onSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: labelText,
                  hintText:hintText ,
                  labelStyle: TextStyle(
                    fontSize: 10.0,),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.black26,fontSize: 15),
                ),
                // controller: passwordController,
                onSaved: onSaved,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return messReturn;
                  }
                  return null;
                },
              ),
            ),
          );
  }
}

// class ConfirmPassword extends StatelessWidget {
//   const ConfirmPassword({super.key, required this.confirmPasswordController});
// final TextEditingController? confirmPasswordController;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5.0),
//               child: TextFormField(
//                 autofocus: false,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Confirm Password',
//                   labelStyle: TextStyle(
//                     fontSize: 10.0,),
//                     border: OutlineInputBorder(),
//                     errorStyle: TextStyle(color: Colors.black26,fontSize: 15),
//                 ),
//                 controller: confirmPasswordController,
//                 validator: (value){
//                   if(value==null || value.isEmpty){
//                     return 'Please confirm password';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//           );
//   }
// }