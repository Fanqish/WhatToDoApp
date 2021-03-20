import 'package:get/get.dart';
import 'utils/online/other.dart';
import 'consts/global.dart';

class AppController extends GetxController {
  RxString whatToDo = "Suggest What To Do?".obs;
  bool oneclick = false;
  void getToDo() async {
    oneclick = true;
    checkInternet();
    internet.value
        ? whatToDo.value =
            (await (await GetConnect().get(api)).body["activity"])
        : whatToDo.value = "There Is No Internet";
    oneclick = false;
  }
}

class AppControllerBinder implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
  }
}
