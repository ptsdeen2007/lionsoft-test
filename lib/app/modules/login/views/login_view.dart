import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lionsbot_task/app/core/const/app_const.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return Scaffold(
      body: Obx(() {
        return Container(
          decoration: backgroundImage,
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Login IN",
                    style:
                        Get.textTheme.titleLarge!.copyWith(color: Colors.white),
                  ),
                  Expanded(
                    child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                controller: controller.tecUserName,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  filled: true,
                                  border: textFieldBorder,
                                  fillColor: Colors.white,
                                  // labelStyle: TextStyle(color: Colors.grey),
                                ),
                                validator: (text) => !text!.contains("@")
                                    ? "please enter Valid Email"
                                    : null),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                controller: controller.tecPassword,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    filled: true,
                                    border: textFieldBorder,
                                    fillColor: Colors.white,
                                    suffixIcon: InkWell(
                                      onTap: () =>
                                          controller.obscureText.toggle(),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Text(
                                          "Show",
                                          style: TextStyle(
                                              color: Colors.lightBlueAccent),
                                        ),
                                      ),
                                    )),
                                obscureText: controller.obscureText.value,
                                validator: (text) => text!.length < 5
                                    ? "Invalid Password"
                                    : null),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                      onPressed: controller.loginWidhUserNameAndPassword,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Log in"),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
