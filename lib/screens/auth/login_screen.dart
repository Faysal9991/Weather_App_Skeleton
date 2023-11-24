import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/admin/admin.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/provider/authprovider.dart';
import 'package:weather_app/screens/auth/views/sign_up_Screen.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/util/custom_text_field.dart';
import 'package:weather_app/util/theme/text.style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70)),
                  color: Colors.pink,
                  boxShadow: Helper.softUiShadow),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 100,
                    color: Colors.white,
                  ),
                  Text(
                    "Wellcome to location",
                    style: latoStyle700Bold.copyWith(
                        fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: CustomTextField(
                  controller: emailController,
                  validation: (email) {
                    if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email!)) {
                      return null;
                    } else {
                      return 'Please enter a valid email';
                    }
                  },
                  borderRadius: 30,
                  fillColor: Colors.white,
                  isShowBorder: true,
                  verticalSize: 15,
                  horizontalSize: 20,
                  hintText: "Email",
                )),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: CustomTextField(
                  controller: passwordController,
                  validation: (password) {
                    if (password!.isEmpty) {
                      return "please enter your password";
                    } else {
                      return null;
                    }
                  },
                  borderRadius: 30,
                  fillColor: Colors.white,
                  isShowBorder: true,
                  verticalSize: 15,
                  horizontalSize: 20,
                  hintText: "Password",
                )),
            const SizedBox(
              height: 20,
            ),
            Text.rich(TextSpan(
                text: 'If you dont have account please',
                style: latoStyle400Regular.copyWith(
                    color: Colors.black45, fontSize: 10),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Helper.toScreen(context, const SignUpScreen());
                      },
                    text: ' Sign Up',
                    style: latoStyle700Bold.copyWith(
                        fontSize: 20, color: Colors.pink),
                  )
                ])),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 20,
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    )),
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(radius: 20, child: FaIcon(FontAwesomeIcons.apple)),
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                    radius: 20,
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.pink,
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Consumer<AuthProvider>(
                      builder: (context, provider, child) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (emailController.text == "admin@0011.net.google" &&
                              passwordController.text == "99%correct6677&") {
                            Helper.toRemoveUntilScreen(
                                context, const AdminScreen());
                          } else {
                            provider
                                .signIn(emailController.text,
                                    passwordController.text)
                                .then((value) {
                              if (value) {
                                Helper.toRemoveUntilScreen(
                                    context, const HomePage());
                              }
                            });
                          }
                        }
                      },
                      child: const Text("login"),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
