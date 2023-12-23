import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key,  this.text='', 
   this.color=Colors.black, 
    this.fontSize=16, 
    this.alignment=Alignment.topLeft, this.maxLine, this.height=1});
  final String text;
  final Color color;
  final double fontSize;
  final Alignment alignment;
  final int? maxLine;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          height:height ,
          color: color,
          fontSize: fontSize),
          maxLines: maxLine,
          ),
    );
  }
}