import 'package:ema_shop/constants.dart';
import 'package:ema_shop/helper/enum.dart';
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery =Delivery.StanderdDelivery;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children:  [
          SizedBox(height: 20,),
          RadioListTile<Delivery>(
            value: Delivery.StanderdDelivery,
            groupValue:delivery,
            onChanged: (Delivery? value){
              setState(() {
                delivery = value!;
              });
            },
          title: CustomText(
              text:'Started Delivery',
              fontSize: 20,
            ),
            subtitle: CustomText(
              text:'\nOrder will be delivered between 3-5 business days',
              fontSize: 15,
            ),
            activeColor: primaryColor,
            ),
            
            SizedBox(height: 20,),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value){
              setState(() {
                delivery = value!;
              });
            },
          title: CustomText(
              text:'Next Day Delivery',
              fontSize: 20,
            ),
            subtitle: CustomText(
              text:'\nPlace your order before 6pm and your times will be delivered the next day',
              fontSize: 15,
            ),
            activeColor: primaryColor,
            ),
            SizedBox(height: 20,),
             RadioListTile<Delivery>(
            value: Delivery.NominatedDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value){
              setState(() {
                delivery = value!;
              });
            },
          title: CustomText(
              text:'Nominated Delivery',
              fontSize: 20,
            ),
            subtitle: CustomText(
              text:'\nPick a particular date from the calender and order will be delivered on selected date',
              fontSize: 15,
            ),
            activeColor: primaryColor,
            ),
        
        ],
      ),
    );
  }
}