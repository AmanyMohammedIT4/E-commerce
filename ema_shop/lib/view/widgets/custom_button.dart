import 'package:ema_shop/constants.dart';
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text,
   this.color=primaryColor, this.textColor=Colors.white});
final VoidCallback? onPressed;
final String text;
final Color color;
final Color textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: onPressed,
      child: Container(
        // height: 50,
        // width: 70,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: primaryColor,
          ),
        ),
        padding: EdgeInsets.all(18),
      child:Center(
        child:CustomText(text: text,alignment: Alignment.center,color: textColor,)
      )
      ),
 
    );
    //  ElevatedButton(
    //           style: ButtonStyle(backgroundColor:MaterialStateProperty<Colors?>()
    //           ),
    //           onPressed: onPressed,
    //           child: Text(text,
    //           style: TextStyle(fontSize: 10.0,color:Color.fromARGB(255, 204, 167, 4)),
    //           ),
    //         );
  }
}


class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({super.key,
   required this.text, this.iconData, 
   this.onTap, this.color});
  final String text;
  final IconData? iconData;
  final VoidCallback? onTap;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        // width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xff707070),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: color,
            ),
            SizedBox(width: 90,),
            Text(
              text,
              style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xff000000)
            ),
            textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }
}



class TextButtonItem extends StatelessWidget {
  const TextButtonItem({super.key, required this.onPressed, required this.text});
final VoidCallback? onPressed;
final String? text;
  @override
  Widget build(BuildContext context) {
    return  TextButton(
            onPressed: onPressed,
            child: Text(text!,
            style: TextStyle(fontSize: 12.0,color: Color.fromARGB(255, 204, 167, 4)),));
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({super.key, required this.onPressed, required this.textBut, required this.textMes});
final VoidCallback? onPressed;
final String textBut;
final String textMes;
  @override
  Widget build(BuildContext context) {
    return  Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(textMes),
                    TextButton(
                    onPressed: onPressed,
                    child: Text(textBut, style: TextStyle(color: Color.fromARGB(255, 204, 167, 4)),
                    )),
                  ],
                ),
              );
  }
}