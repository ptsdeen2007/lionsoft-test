import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lionsbot_task/app/core/const/app_const.dart';
import 'package:lionsbot_task/app/modules/remote/views/widget/joy_stick.dart';

import '../controllers/remote_controller.dart';

class RemoteView extends GetView<RemoteController> {
  const RemoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Container(
          decoration: backgroundImage,
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Stack(alignment: Alignment.center, children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => controller.navigatBack()),
                ),
                Text(
                  "Remote Controll",
                  style:
                      Get.textTheme.titleLarge!.copyWith(color: Colors.white),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Divider(
                  thickness: 1,
                  color: Colors.white24,
                  endIndent: 40,
                  indent: 40,
                  height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    "WATER",
                    style: TextStyle(color: Colors.white),
                  ),
                  Switch(
                      value: controller.waterSwich.value,
                      onChanged: controller.watterSwichPressed),
                  Container(
                    width: 1,
                    color: Colors.white24,
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.fingerprint,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "BRUSH",
                    style: TextStyle(color: Colors.white),
                  ),
                  Switch(
                      value: controller.brushSwich.value,
                      onChanged: controller.brushSwichPressed),
                ],
              ),
              Divider(
                  thickness: 1,
                  color: Colors.white24,
                  endIndent: 40,
                  indent: 40,
                  height: 0),
              SizedBox(
                height: 20,
              ),
              JoyStick(
                callback: callBack,
                radius: 100,
                stickRadius: 50,
              ),
              FractionallySizedBox(
                  widthFactor: .9,
                  child: ElevatedButton(
                    onPressed: controller.changeState,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        controller.isStarted.value ? "STOP" : "START",
                        style: Get.textTheme.titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: controller.isStarted.value
                            ? Colors.red
                            : Colors.lightBlue),
                  )),
              Expanded(
                child: DraggableScrollableSheet(
                  initialChildSize: 0.36,
                  minChildSize: 0.36,
                  maxChildSize: .60,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18),
                              topLeft: Radius.circular(18),
                            ),
                            color: Colors.lightBlue),
                        child: Obx(() {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(16),
                                width: 80,
                                height: 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                              ),
                              Icon(
                                Icons.settings_outlined,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("SETTINGS",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 24),
                                  child: Text(
                                      "Speed: ${controller.sliderValue.toInt()}",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                alignment: Alignment.bottomLeft,
                              ),
                              Slider(
                                activeColor: Colors.blueAccent,
                                inactiveColor: Colors.white,
                                thumbColor: Colors.white,
                                value: controller.sliderValue.value,
                                onChanged: controller.chageSlider,
                                min: 1,
                                max: 100,
                              )
                            ],
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        );
      }),
    );
  }

  callBack(x, y) {}
}
