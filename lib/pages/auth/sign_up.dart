import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_page/service/auth_service.dart';
import 'package:firebase_login_page/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email, password, username, fullname;
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
                      fullnameTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      usernameTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextButton(
                          onPressed: signUp, buttonText: "Kayıt Ol"),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, "/loginPage"),
                          buttonText: "Giriş Sayfasına Geri Dön"),
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

  TextFormField usernameTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "burasi boş birakilamaz";
        } else {}
        return null;
      },
      onSaved: (value) {
        username = value!;
      },
      decoration: customInputDecoration("kullanıcı adı"),
    );
  }

  TextFormField fullnameTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bu alan boş bırakılamaz";
        } else {}
        return null;
      },
      onSaved: (value) {
        fullname = value!;
      },
      decoration: customInputDecoration("İsminiz"),
    );
  }

  // TextButton signUpButton() {
  //   return TextButton(
  //       onPressed: signIn,
  //       child: Text(
  //         "Kayıt Ol",
  //         style: TextStyle(color: Colors.purple, fontSize: 16),
  //       ));
  // }

  void signUp() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final result = authService.signUp(email, password, fullname, username);
      Navigator.pushNamed(context, "/loginPage");
    } else {}
  }

  // TextButton backToLoginPage() {
  //   return TextButton(
  //       onPressed: () => Navigator.pushNamed(context, "/loginPage"),
  //       child: Text(
  //         "Giriş Sayfasına Geri Dön",
  //         style: TextStyle(color: Colors.purple, fontSize: 16),
  //       ));
  // }

  TextFormField passwordTextField() {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "şifre uzunluğu en az 6 haneli olmalı";
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
          return "Bilgileri tam doldurun!";
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
