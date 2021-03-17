import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:popup/utils/database/init-data.dart';
import 'consts/themes.dart';
import 'controller.dart';
import 'routes.dart';

void main() async {
  await Hive.initFlutter();
  await openBoxes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: themeModeNow.value,
      initialBinding: AppControllerBinder(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
