
 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ng_demo_17/pages/signup_page.dart';

import '../pages/home_page.dart';
import '../services/auth_service.dart';
import '../services/pref_service.dart';
import '../services/utils_service.dart';

class SignInController extends GetxController{

  var isLoading = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  doSignIn(BuildContext context) {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    if (email.isEmpty || password.isEmpty) return;


      isLoading = false;
      update();

    AuthService.signInUser(context, email, password).then((firebaseUser) => {
      getFirebaseUser(firebaseUser),
    });

    // _callHomePage();
  }

  getFirebaseUser(User? firebaseUser) async {

      isLoading = false;
      update();

    if (firebaseUser != null) {
      await Prefs.saveUserId(firebaseUser.uid);
      callHomePage();
    } else {
      Utils.fireToast("Check your email or password");
    }
  }



  callHomePage(){
    // Navigator.pushReplacementNamed(context, HomePage.id);
    Get.offNamed(HomePage.id);
  }

  callSignUpPage() {
    // Navigator.pushReplacementNamed(context, SignUpPage.id);
    Get.offNamed(SignUpPage.id);
  }
}