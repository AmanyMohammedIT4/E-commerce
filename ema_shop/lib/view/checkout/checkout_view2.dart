// import 'package:ema_shop/constants.dart';
// import 'package:ema_shop/core/view_model/checkout_view_model.dart';
// import 'package:ema_shop/view/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:status_change/status_change.dart';

// class CheckOutView extends StatelessWidget {

//   final _processes = [
//     'Order Signed',
//     'Order Processed',
//     'Shipped ',
//     'Out for delivery ',
//     'Delivered ',
//   ];

//   final _content = [
//     '20/18',
//     '20/18',
//     '20/18',
//     '20/18',
//     '20/18',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CheckOutViewModel>(
//       init: CheckOutViewModel(),
//       builder:(controller)=> Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           elevation: 0.0,
//           title: const Text(
//             "CheckOut",
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             Expanded(
//               child: StatusChange.tileBuilder(
//                 theme: StatusChangeThemeData(
//                   direction: Axis.horizontal,
//                   connectorTheme:
//                       const ConnectorThemeData(space: 1.0, thickness: 1.0),
//                 ),
//                 builder: StatusChangeTileBuilder.connected(
//                   itemWidth: (_) =>
//                       MediaQuery.of(context).size.width / _processes.length,
//                   contentWidgetBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Text(
//                         _processes[index],
//                         style: const TextStyle(
//                           color: Colors
//                               .blue, // change color with dynamic color --> can find it with example section
//                         ),
//                       ),
//                     );
//                   },
//                   nameWidgetBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Text(
//                         _content[index],
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color:controller.getColor(index),
//                         ),
//                       ),
//                     );
//                   },
//                   indicatorWidgetBuilder: (_, index) {
//                     if (index <= controller.index) {
//                       return DotIndicator(
//                         size: 35.0,
//                         border: Border.all(color: Colors.teal, width: 1),
//                         child: Padding(
//                           padding: const EdgeInsets.all(6.0),
//                           child: Container(
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.teal,
//                             ),
//                           ),
//                         ),
//                       );
//                     } else {
//                       return const OutlinedDotIndicator(
//                         size: 30,
//                         borderWidth: 1.0,
//                         color: todoColor,
//                       );
//                     }
//                   },
//                   lineWidgetBuilder: (index) {
//                     if (index > 0) {
//                       if (index == controller.index) {
//                         final prevColor =controller.getColor(index - 1);
//                         return DecoratedLineConnector(
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [
//                             prevColor,
//                            controller.getColor(index + 1)
//                           ],
//                             ),
//                           ),
//                         );
//                       } else {
//                         return SolidLineConnector(
//                           color: controller.getColor(index),
//                         );
//                       }
//                     } else {
//                       return null;
//                     }
//                   },
//                   itemCount: _processes.length,
//                 ),
//               ),
//             ),
//             // controller.pages == Pages.deliveryTime
//             // ? DeliveryTime()
//             // : controller.pages == Pages.addAddress
//             //   ? AddAddress()
//             //   : Summary(),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//              controller.index == 0 ? Container() : Align(
//                 alignment: Alignment.bottomRight,
//                 child: Container(
//                   padding: EdgeInsets.all(20),
//                   width: 200,
//                   height: 100,
//                   child: CustomButton(
//                     onPressed: (){
//                     controller.changeIndex(controller.index - 1);
//                     }, 
//                   color: Colors.white,
//                   textColor: primaryColor,
//                   text: 'Back'),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: Container(
//                   padding: EdgeInsets.all(20),
//                   width: 200,
//                   height: 100,
//                   child: CustomButton(onPressed: (){
//                     controller.changeIndex(controller.index+1);
//                   }, text: 'NEXT'),
//                 ),
//               ),
//             ],
//           )

//           ],
//         ),
//       ),
//     );
//   }
// }
