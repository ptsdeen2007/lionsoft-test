import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/remote_controller.dart';

class RemoteView extends GetView<RemoteController> {
  const RemoteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RemoteView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RemoteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
