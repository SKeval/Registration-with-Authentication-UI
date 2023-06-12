// ignore_for_file: unused_import

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:profilelists/Common/Data.dart';
import 'package:profilelists/Common/ShowMsg.dart';
import 'package:profilelists/Common/Txtfield.dart';
import 'package:profilelists/ForgotPassword..dart';
import 'package:profilelists/Model.dart';
import 'package:profilelists/Page1.dart';
import 'package:profilelists/Page2.dart';

//login with form field
class LoginFF extends StatefulWidget {
  const LoginFF({super.key});

  @override
  State<LoginFF> createState() => _LoginFFState();
}

class _LoginFFState extends State<LoginFF> {
  TextEditingController emailcon = TextEditingController();
  TextEditingController passcon = TextEditingController();

  //key
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 8.0),
                  child: RichText(
                      text: TextSpan(
                          text: "Don't have an Account ? ",
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black),
                          children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => const Page1(),
                                ));
                              },
                            text: "Sign Up",
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 15))
                      ]))),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 202, 156, 136),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                width: 350,
                height: 340,
                child: Card(
                  color: Colors.transparent,
                  elevation: 20,
                  //shadowColor: Colors.brown,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Txtfield(
                          Onvalidator: (val) {
                            String regMail =
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                            if (!RegExp(regMail).hasMatch(val!)) {
                              return "Email ID doesn't Exist";
                            }

                            if (val.isEmpty) {
                              return "Email Id Should not be Empty";
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
                            if (val!.isEmpty) {
                              return "Password Should not be Empty";
                            }
                            return null;
                          },
                          label: "Password",
                          hint: "Enter Your Password",
                          controller: passcon,
                          icon: Icons.password,
                          pass: true,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (DataList.isEmpty) {
                                  showMsg("No Data Found");
                                } else {
                                  for (var element in DataList) {
                                    if (emailcon.text == element.email) {
                                      if (passcon.text == element.password) {
                                        showMsg("Login Successfull");
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => Page2(),
                                        ));
                                      } else {
                                        showMsg("Password doesn't Matched");
                                      }
                                    } else {
                                      showMsg("No Data Found");
                                    }
                                  }
                                }
                              }
                            },
                            child: const Text("Login")),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => const ForgotPassword(),
                              ));
                            },
                            child: const Text(
                              "Forgot Password?",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                        )
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
