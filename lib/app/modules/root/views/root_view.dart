import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lionsbot_task/app/modules/login/views/login_view.dart';
import 'package:lionsbot_task/app/modules/messages/views/messages_view.dart';
import 'package:lionsbot_task/app/modules/profile/views/profile_view.dart';
import 'package:lionsbot_task/app/modules/remote/views/remote_view.dart';
import 'package:lionsbot_task/app/modules/settings/views/settings_view.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Obx(() {
              return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_outlined),
                      label: 'Profile',
                    ),
               /*     BottomNavigationBarItem(
                      icon: Icon(Icons.message),
                      label: 'Search',
                    ),*/
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings_remote_outlined),
                      label: 'Remote',
                    ),
                  ],
                  currentIndex: controller.currentPage.value,
                  onTap: (int index) => controller.chagePage(index),
                ),
                body: [
                  ProfileView(),
                  // MessagesView(),
                  // SettingsView(),
                  RemoteView()
                ][controller.currentPage.value],
              );
            });
          } else {
            return LoginView();
          }
        });
  }
}
