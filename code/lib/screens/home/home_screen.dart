import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:whattodo/consts/global.dart';
import 'package:get/get.dart';
import '../../widgets/popup_button.dart';
import '../../controller.dart';

class HomeScreen extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kAppName.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [popupMenuButton],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: TextButton(
          style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all(Colors.white.withAlpha(25))),
          child: Obx(() => Container(
              width: context.width * .90,
              height: context.height,
              child: Center(
                child: AutoSizeText(
                  controller.whatToDo.value,
                  textAlign: TextAlign.center,
                  maxLines: 999,
                  softWrap: true,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ))),
          onPressed: () {
            if (!controller.oneclick) controller.getToDo();
          },
        ),
      ),
    );
  }
}
