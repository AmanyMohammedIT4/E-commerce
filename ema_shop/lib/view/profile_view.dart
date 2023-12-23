import 'package:ema_shop/core/view_model/profile_view_model.dart';
import 'package:ema_shop/view/auth/login_screen.dart';
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init:ProfileViewModel() ,
      builder:(controller)=>controller.loading.value ? Center(child: CircularProgressIndicator()) : Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 15),
          child: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Container(
                      //   width: 100,
                      //   height: 100,
                      //   decoration: BoxDecoration(
                      //     color: Colors.red,
                      //     borderRadius: BorderRadius.all(Radius.circular(100),
                      //     ),
                      //     image: DecorationImage(
                      //       image:controller.userModel == null 
                      //       ?
                      //      AssetImage('assets/images/empty.jpg')
                      //      :
                      //      controller.userModel!.pic == 'default'
                      //      ?  AssetImage('assets/images/empty.jpg') 
                      //      : NetworkImage(controller.userModel!.pic,),
                      //      ),
                      // ),),
                      Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              image: DecorationImage(
                                image: controller.userModel == null 
                                  ? AssetImage('assets/images/empty.jpg')
                                  : controller.userModel!.pic == 'default'
                                    ? AssetImage('assets/images/empty.jpg')
                                    // : NetworkImage(controller.userModel!.pic)
                                    : Image.network(controller.userModel!.pic!).image,
                              ),
                            ),
                          ),
                          // ElevatedButton(onPressed: (){
                          //   print(controller.userModel!.name);
                          //   // controller.signOut();
                          //   // Get.offAll(LoginScreen());
                          // }, child: Text("signOut")),
                          Column(
                            children: [
                              CustomText(
                                text:controller.userModel!.name!,
                                color: Colors.black,
                                fontSize: 25,),
                                CustomText(
                                text:controller.userModel!.email!,
                                color: Colors.black,
                                fontSize: 18,),
                            ],
                          ),

                    ],),),
                SizedBox(height: 60,),
                Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: (){

                    },
                    child:ListTile(
                      title: CustomText(
                        text: 'Edit Profile',
                      ),
                      leading: Image.asset('assets/menu_icon/pen.png',width: 30,),
                      trailing: Icon(Icons.navigate_next,color: Colors.black,),
                      tileColor: Colors.white,
                      // shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(0), // تعيين حافة مستطيلة للعنصر
                      //  ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                 Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: (){

                    },
                    child:ListTile(
                      title: CustomText(
                        text: 'Shipping Address',
                      ),
                      leading: Image.asset('assets/menu_icon/location.png',width: 30,),
                      trailing: Icon(Icons.navigate_next,color: Colors.black,),
                      tileColor: Colors.white,
                      // shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(0), // تعيين حافة مستطيلة للعنصر
                      //  ),
                    ),
                  ),
                ),
                 SizedBox(height: 10,),
                 Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: (){

                    },
                    child:ListTile(
                      title: CustomText(
                        text: 'Order History',
                      ),
                      leading: Image.asset('assets/menu_icon/history.png',width: 30,),
                      trailing: Icon(Icons.navigate_next,color: Colors.black,),
                      tileColor: Colors.white,
                      // shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(0), // تعيين حافة مستطيلة للعنصر
                      //  ),
                    ),
                  ),
                ),
                 SizedBox(height: 10,),
                 Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: (){

                    },
                    child:ListTile(
                      title: CustomText(
                        text: 'Cards',
                      ),
                      leading: Image.asset('assets/menu_icon/cards.png',width: 30,),
                      trailing: Icon(Icons.navigate_next,color: Colors.black,),
                      tileColor: Colors.white,
                      // shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(0), // تعيين حافة مستطيلة للعنصر
                      //  ),
                    ),
                  ),
                ),
                 SizedBox(height: 10,),
                 Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: (){

                    },
                    child:ListTile(
                      title: CustomText(
                        text: 'Notifications',
                      ),
                      leading: Image.asset('assets/menu_icon/notification.png',width: 30,),
                      trailing: Icon(Icons.navigate_next,color: Colors.black,),
                      tileColor: Colors.white,
                      // shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(0), // تعيين حافة مستطيلة للعنصر
                      //  ),
                    ),
                  ),
                ),
                 SizedBox(height: 10,),
                 Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: (){
                      controller.signOut();
                      Get.offAll(LoginScreen());
                    },
                    child:ListTile(
                      title: CustomText(
                        text: 'Log Out',
                      ),
                      leading: Image.asset('assets/menu_icon/logout.png',width: 30,),
                      trailing: Icon(Icons.navigate_next,color: Colors.black,),
                      tileColor: Colors.white,
                      // shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(0), // تعيين حافة مستطيلة للعنصر
                      //  ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ) ,)
        )),
      ),
    );
  }
}