
import 'package:get/get.dart';
import 'package:ng_demo_17/controllers/feed_controller.dart';
import 'package:ng_demo_17/controllers/home_controller.dart';
import 'package:ng_demo_17/controllers/likes_controller.dart';
import 'package:ng_demo_17/controllers/profile_controller.dart';
import 'package:ng_demo_17/controllers/search_page_controller.dart';
import 'package:ng_demo_17/controllers/signin_controller.dart';
import 'package:ng_demo_17/controllers/signup_controller.dart';
import 'package:ng_demo_17/controllers/splash_controller.dart';
import 'package:ng_demo_17/controllers/upload_controller.dart';

class RootBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController(), fenix:  true);
    Get.lazyPut(() => HomeController(), fenix:  true);
    Get.lazyPut(() => FeedController(), fenix:  true);
    Get.lazyPut(() => SearchPageController(), fenix:  true);
    Get.lazyPut(() => SignInController(), fenix:  true);
    Get.lazyPut(() => SignUpController(), fenix:  true);
    Get.lazyPut(() => ProfileController(), fenix:  true);
    Get.lazyPut(() => UploadController(), fenix:  true);
    Get.lazyPut(() => LikesController(), fenix:  true);


  }
}