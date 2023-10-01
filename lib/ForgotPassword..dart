// ignore_for_file: unused_import, file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:profilelists/Common/Data.dart';
import 'package:profilelists/Common/ShowMsg.dart';
import 'package:profilelists/Common/Txtfield.dart';
import 'package:profilelists/Common/colors.dart';
import 'package:profilelists/Page1.dart';
import 'package:profilelists/Page2.dart';
import 'package:profilelists/login_ff.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailcon = TextEditingController();
  TextEditingController passcon = TextEditingController();
  TextEditingController conpasscon = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: bg,
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                width: 350,
                height: 440,
                child: Card(
                  color: Colors.transparent,
                  elevation: 20,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Txtfield(
                          Onvalidator: (val) {
                            if (val!.isEmpty) {
                              return "Email ID Should not be Empty";
                            }

                            String regMail =
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                            if (!RegExp(regMail).hasMatch(val)) {
                              return "Please enter valid email id";
                            }
                            return null;
                          },
                          label: "Email",
                          hint: "Enter Your Email",
                          controller: emailcon,
                          keyboard: TextInputType.emailAddress,
                          icon: Icons.email,
                        ),
                        Txtfield(
                          Onvalidator: (val) {
                            String regPassword =
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                            if (val!.isEmpty) {
                              return "Password Should not be Empty";
                            }
                            if (!RegExp(regPassword).hasMatch(val)) {
                              return "Please enter Valid Password";
                            }
                            return null;
                          },
                          label: "Password",
                          hint: "Enter Your Password",
                          controller: passcon,
                          icon: Icons.password,
                          pass: true,
                        ),
                        Txtfield(
                          Onvalidator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Password Again.";
                            }
                            return null;
                          },
                          label: "Confirm Password",
                          hint: "Confirm Your Password",
                          controller: conpasscon,
                          icon: Icons.password,
                          pass: true,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (passcon.text == conpasscon.text) {
                                  for (var element in DataList) {
                                    if (emailcon.text == element.email) {
                                      element.password = passcon.text;
                                    }
                                  }
                                  showMsg("Password changed successfully");
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginFF(),
                                      ));
                                } else {
                                  showMsg(
                                      "Password & Confirm Password should be Same");
                                }
                              }
                            },
                            child: const Text("Login")),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
