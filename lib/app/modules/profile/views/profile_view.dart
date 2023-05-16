import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lionsbot_task/app/core/const/app_const.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      body: Container(
        decoration: backgroundImage,
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      child: Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.snackbar("Warning", "Not integrated",snackPosition: SnackPosition.BOTTOM);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Home",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Text(
                          "Profile",
                          style: Get.textTheme.titleLarge!
                              .copyWith(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            controller.logout();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Logout",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Color(0xfff2f2f2),
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            GradientText(
                              'Victoria Rebertson',
                              style: TextStyle(
                                fontSize: 25.0,
                              ),
                              radius: 2.5,
                              colors: [
                                Colors.blue,
                                Colors.red,
                                Colors.orangeAccent,
                              ],
                            ),
                            Text(
                              "Creaning Hours:18",
                              style: Get.textTheme.titleSmall,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ToggleSwitch(
                              minWidth: 180.0,
                              minHeight: 40,
                              borderWidth: 1,
                              borderColor: [Colors.grey],
                              cornerRadius: 20.0,
                              activeBgColors: [
                                [Colors.white],
                                [Colors.red[800]!]
                              ],
                              activeFgColor: Colors.lightBlueAccent,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              initialLabelIndex: 0,
                              totalSwitches: 2,
                              labels: ['Points', 'Badges'],
                              radiusStyle: true,
                              onToggle: (index) {
                                print('switched to: $index');
                              },
                            ),
                            SizedBox(height: 20,),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: pointsModels.length,
                                  itemBuilder: (context, postion) {
                                    var item=pointsModels[postion];
                                    return ListTile(
                                      title: Text(item.title,
                                          style: Get.textTheme.titleSmall),
                                      subtitle: Text(
                                        item.subtitle,
                                        style: Get.textTheme.bodySmall!
                                            .copyWith(color: Colors.black),
                                      ),
                                      trailing: Text(
                                        "83 ago",
                                        style: Get.textTheme.labelSmall!
                                            .copyWith(color: Colors.black26),
                                      ),
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      )),
                ],
              ),
              Align(
                  alignment: Alignment(0, -.6),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(width: 4, color: Colors.white),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1622782262026-6a327a45014f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"))),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
