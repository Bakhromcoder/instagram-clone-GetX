import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ng_demo_17/config/root_binding.dart';
import 'package:ng_demo_17/pages/home_page.dart';
import 'package:ng_demo_17/pages/signin_page.dart';
import 'package:ng_demo_17/pages/signup_page.dart';
import 'package:ng_demo_17/pages/splash_page.dart';
import 'package:ng_demo_17/services/notif_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotifService().init();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      initialBinding: RootBinding(),
      routes: {
        SplashPage.id: (context) =>  SplashPage(),
        HomePage.id: (context) =>  HomePage(),
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),
      },
    );
  }
}

