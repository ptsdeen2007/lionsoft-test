import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var formKey=GlobalKey<FormState>();
  var tecUserName=TextEditingController();
  var tecPassword=TextEditingController();
  var obscureText=true.obs;

  @override
  void onInit() {
    // tecUserName.text="lionsbot@test.com";
    // tecPassword.text="Test@123";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> loginWidhUserNameAndPassword() async {
    print("Triggered");
    if(formKey.currentState!.validate()){
     try {
       var user= await  FirebaseAuth.instance.signInWithEmailAndPassword(email: tecUserName.text.trim(), password: tecPassword.text.trim());
      formKey.currentState!.reset();
     } catch (e) {
       Get.snackbar("Error", "Incorrect User name or password",snackPosition: SnackPosition.BOTTOM);
     }

    }
  }

}
