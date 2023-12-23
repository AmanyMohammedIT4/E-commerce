import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
   this.inputType, this.suffexIcon,
    this.onSaved, this.onChanged, 
    this.maxLines, this.text, this.hint, required this.validator});
  final TextInputType? inputType;
  final Widget? suffexIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final int? maxLines;
  final String? text;
  final String? hint;
 final FormFieldValidator<String> validator;




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text:text!,fontSize: 14 ,color: Colors.grey.shade900),
          TextFormField(
            validator:validator,
            // keyboardType: inputType,
            // onChanged: onChanged,
            onSaved: onSaved,
            // maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
              ),
              // filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xffCCCCCCC)))
            ),
          ),
        ],
      ),
    );
  }
}