import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_page/service/auth_service.dart';
import 'package:firebase_login_page/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/topImage.png"),
                        fit: BoxFit.cover)),
              ),
              const Text(
                "Merhaba, \n Hoşgeldin :)",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      emailTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      passwordTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextButton(
                          onPressed: () {
                            final result = authService.forgotPassword(email);
                          },
                          buttonText: "Şifremi Unuttum"),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextButton(
                        onPressed: signIn,
                        buttonText: "Giriş",
                        textColor: Colors.white,
                        fontSize: 20,
                        backgroundColor: const Color.fromARGB(255, 128, 18, 147),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, "/signUp"),
                          buttonText: "Kayıt Ol"),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextButton(
                          onPressed: () async {
                            final result = await authService.signInAnonymous();
                            if (result != null) {
                              Navigator.pushNamed(context, "/tabBarController");
                            } else {
                              print("Hata ile karşılaşıldı.");
                            }
                          },
                          buttonText: "Misafir Girişi")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // TextButton signUpButton() {
  //   return TextButton(
  //       onPressed: () => Navigator.pushNamed(context, "/signUp"),
  //       child: Text(
  //         "Kayıt Ol",
  //         style: TextStyle(color: Colors.purple, fontSize: 16),
  //       ));
  // }

  // TextButton signInButton() {
  //   return TextButton(
  //       style: ElevatedButton.styleFrom(
  //           backgroundColor: Color.fromARGB(255, 128, 18, 147),
  //           fixedSize: Size(150, 50)),
  //       onPressed: signIn,
  //       child: Text(
  //         "Giriş",
  //         style: TextStyle(fontSize: 20,color: Colors.white),
  //       ));
  // }

  void signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final result = await authService.signIn(email, password);
      if (result == "success") {
        Navigator.pushNamed(context, "/tabBarController");
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Hata"),
                content: Text(result!),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text("Geri Dön"),)
                ],
              );
            });
      }
    } else {}
  }

  // TextButton forgotPasswordButton() {
  //   return TextButton(
  //       onPressed: () {},
  //       child: Text(
  //         "Şifremi Unuttum",
  //         style: TextStyle(color: Colors.purple),
  //       ));
  // }

  TextFormField passwordTextField() {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "şifre en az 6 haneli olmalı";
          } else {}
          return null;
        },
        onSaved: (value) {
          password = value!;
        },
        obscureText: true,
        decoration: customInputDecoration("Sifre"));
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri tam doldurun";
        } else {}
        return null;
      },
      onSaved: (value) {
        email = value!;
      },
      decoration: customInputDecoration("email"),
    );
  }

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(hintText: hintText);
  }
}
