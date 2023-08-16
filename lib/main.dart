import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_page/firebase_options.dart';
import 'package:firebase_login_page/pages/auth/login_page.dart';
import 'package:firebase_login_page/pages/auth/sign_up.dart';
import 'package:firebase_login_page/pages/home_page.dart';
import 'package:firebase_login_page/pages/tab_bar_controller.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        routes: {
          "/loginPage":(context) => const LoginPage(),
          "/signUp":(context) => const SignUp(),
          "/homePage":(context) => const HomePage(),
          "/tabBarController":(context) => const TabBarController(),
        },
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.purple)
        ),
        debugShowCheckedModeBanner: false,
        home:  Scaffold(
          body: LoginPage(),
        )
    );
  }
}
