
import 'package:ema_shop/core/services/fireStore_user.dart';
import 'package:ema_shop/helper/local_storage_data.dart';
import 'package:ema_shop/model/user_model.dart';
import 'package:ema_shop/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn=GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  
  String? email,password,name;
  // String? email,password,name;

  Rxn<User> _user=Rxn<User>();
  
 String? get user=> _user.value?.email;

 final LocalStorageData localStorageData= Get.find<LocalStorageData>();
  @override
  void onInit(){
    super.onInit();
    // print(_auth.currentUser);
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser != null){
      getCurrentUserData(_auth.currentUser!.uid);
    }
  }
   @override
  void onReady(){
    super.onReady();
  }
    @override
  void onClose(){
    super.onClose();
  }


  void googleSignInMethod() async{
    final GoogleSignInAccount? googleUser= await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

     await _auth.signInWithCredential(credential).then((user) async{
       
       saveUser(user);
        Get.offAll(()=>ControlView());
      });
    
  }


    void  facebookSignInMethod() async{
       FacebookLoginResult result = await _facebookLogin.logIn(permissions: [
    FacebookPermission.email,
  ]);
      final accessToken =result.accessToken!.token;

      if(result.status == FacebookLoginStatus.success){
        final faceCredential =FacebookAuthProvider.credential(accessToken);

        await _auth.signInWithCredential(faceCredential).then((user) async{
          saveUser(user);
      });
      }
   
  }

//  @override
//   Future<Either<Exception, UserCredential>> loginWithFacebook() async{
// try{
//     // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();

//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

//   // Once signed in, return the UserCredential
//   return right(await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential));

// }catch(e){
//   return Left(Exception('Failed to sign in with Facebook'));
// }
//   }
  
  void sinInWithEmailAndPassword()async{
    try{
      await _auth.signInWithEmailAndPassword(email: email!, password: password!).then((value)async{
        // await FireStoreUser().getCurrentUser(value.user!.uid).then((value){
        //   // setUser(UserModel.fromJson(value.data()));
        //   if (value.data() != null) {
        //   setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
        //    Get.offAll(() => ControlView());
        // } else {
        //   print('User data not found');
        // }
        // });
        getCurrentUserData(value.user!.uid);
      });
      Get.offAll(()=>ControlView());

    }on FirebaseAuthException catch(e){
      print(e);
      Get.snackbar("Error Login account", e.message.toString(),
      colorText: Colors.black,snackPosition: SnackPosition.BOTTOM);
    }
  }

   void CreateAccountWithEmailAndPassword()async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email!, password: password!).then((user) async{
       saveUser(user);
      });
      Get.offAll(()=>ControlView());
    }on FirebaseAuthException catch(e){
      print(e);
      Get.snackbar("Error Login account", e.message.toString(),
      colorText: Colors.black,snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async{
    UserModel userModel=UserModel(
          userId: user.user!.uid,
          email: user.user!.email,
          name: name==null ? user.user!.displayName : name,
          pic: ''
        );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

void getCurrentUserData(String uid)async{
  await FireStoreUser().getCurrentUser(uid).then((value){
    setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
  });
}
  void setUser(UserModel userModel)async{
    await localStorageData.setUser(userModel);
  }
}

