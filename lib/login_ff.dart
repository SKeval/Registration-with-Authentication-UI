// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:profilelists/Common/Data.dart';
import 'package:profilelists/Common/ShowMsg.dart';
import 'package:profilelists/Common/Txtfield.dart';
import 'package:profilelists/Common/colors.dart';
import 'package:profilelists/Common/loginrepo.dart';
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

  login() {
    LoginRepo()
        .getDetails(emailcon.text.trim(), passcon.text.trim())
        .then((value) {
      if (value == 'NA') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User or Password is Incorrect')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Success Token : $value')));
      }
    });
  }

  //Awesome Diologue
  ShowAwesomeLogin(String user) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      title: 'Login Successfull',
      // desc: 'Welcome $user',
      btnCancelOnPress: () {},
      body: const Text("Hello Diolog"),
      btnOkOnPress: () {},
      dismissOnTouchOutside: false,
    ).show();
  }

//Alert Diologue
  ShowLoginDiolouge(String user) {
    showDialog(
      context: context,
      builder: (context) {
        //   return Dialog(
        //     backgroundColor: Colors.yellow,
        //     child: Container(
        //       height: 300,
        //       color: Colors.black,
        //       child: Column(
        //         children: [const Text("Login Successful")],
        //       ),
        //     ),
        //   );
        return AlertDialog(
          title: const Text("Login Successful"),
          content: Text("Welcome, How was your day $user"),
          actions: [
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //     child: const Text("OK")),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Page2(),
                  ));
                },
                child: const Text("OK")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/design/bg.png',
                  height: 150,
                  width: 150,
                )
              ],
            ),
            Center(
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
                    decoration: BoxDecoration(
                        color: bg,
                        // color: Color.fromARGB(255, 202, 156, 136),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
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
                                  login();
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) => Page2(),
                                  // ));

                                  // if (formKey.currentState!.validate()) {
                                  //   if (DataList.isEmpty) {
                                  //     showMsg("No Data Found");
                                  //   } else {
                                  //     for (var element in DataList) {
                                  //       if (emailcon.text == element.email) {
                                  //         if (passcon.text ==
                                  //             element.password) {
                                  //           showMsg("Login Successfull");
                                  //         } else {
                                  //           showMsg("Password doesn't Matched");
                                  //         }
                                  //       } else {
                                  //         showMsg("No Data Found");
                                  //       }
                                  //  }
                                  //  }
                                  //}
                                },
                                child: const Text("Login")),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPassword(),
                                  ));
                                },
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}
