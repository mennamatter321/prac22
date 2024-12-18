import 'package:flutter/material.dart';
import 'package:flutter_email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:prac22/screens/home.dart';
import 'package:prac22/screens/signup.dart';
import 'package:prac22/widgets/custtombutton.dart';
import 'package:prac22/widgets/textfield.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool isVisiable = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedEmail = prefs.getString('email');
    final String? savedPassword = prefs.getString('password');

    if (savedEmail == emailController.text &&
        savedPassword == passwordController.text) {
      // إذا كانت البيانات المدخلة صحيحة
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const homepage();
        },
      ));
    } else {
      // إذا كانت البيانات المدخلة غير صحيحة
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid email or password!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Coffee Beans by Siede Preis.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                children: [
                  const Image(
                      image: AssetImage(
                          "assets/hot-drink-coffee-cup-svgrepo-com (1).png"),
                      height: 120),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                      controller: emailController,
                      validator: (value) {
                        return value != null && !EmailValidator.validate(value)
                            ? "Enter a valid email"
                            : null;
                      },
                      hinttext: "Email",
                      suffixIcon: const Icon(Icons.email),
                      obscureText: false),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisiable = !isVisiable;
                          });
                        },
                        icon: isVisiable
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    validator: (value) {
                      return value!.length < 6
                          ? "Enter at least 6 characters"
                          : null;
                    },
                    hinttext: "Password",
                    obscureText: isVisiable ? true : false,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            // يمكن إضافة منطق لاسترجاع كلمة المرور هنا
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ))),
                  CustomButton(
                    text: "Sign in",
                    onPressed: () async {
                      await signIn();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const Signup();
                                  },
                                ));
                              },
                              child: const Text("Signup",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20)))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
