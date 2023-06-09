// ignore_for_file: must_call_super, duplicate_ignore, file_names, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profilelists/Common/ShowMsg.dart';
import 'package:profilelists/Common/Txtfield.dart';
import 'package:profilelists/Common/Validation.dart';
import 'package:profilelists/Model.dart';
import 'package:profilelists/Page2.dart';

enum valuetype { name, email, password, phone, birthdate }

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<Model> model = [];
  TextEditingController namecon = TextEditingController();
  TextEditingController emailcon = TextEditingController();
  TextEditingController numbercon = TextEditingController();
  TextEditingController passcon = TextEditingController();
  TextEditingController datercon =
      TextEditingController(text: 'Select Date Time');
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  choosetime(BuildContext context) async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      time = value!;
      setState(() {
        datercon.text = setText(date, time);
      });
    });
    ;
  }

  String setText(DateTime date, TimeOfDay time) {
    DateFormat formatter = DateFormat('dd-MMM-yyyy');
    formatter.format(date);
    time.format(context);

    String ans =
        '${date.day}-${date.month}-${date.year}  ${time.format(context)}';

    return ans;
  }

  chooseDate(BuildContext context) async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1990),
            lastDate: DateTime.now())
        .then((value) {
      date = value!;
      choosetime(context);
    });
  }

  // ignore: must_call_super
  @override
  void dispose() {
    namecon.dispose();
    emailcon.dispose();
    numbercon.dispose();
    datercon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Form"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 202, 156, 136),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                width: 350,
                height: 600,
                child: Card(
                  color: Colors.transparent,
                  elevation: 20,
                  //shadowColor: Colors.brown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Txtfield(
                        label: "Name",
                        hint: "Enter Your Name",
                        controller: namecon,
                        icon: Icons.person_2_sharp,
                      ),
                      Txtfield(
                        label: "Email",
                        hint: "Enter Your Email",
                        controller: emailcon,
                        keyboard: TextInputType.emailAddress,
                        icon: Icons.email,
                      ),
                      Txtfield(
                        label: "Mobile Number",
                        hint: "Enter Your Mobile Number",
                        controller: numbercon,
                        keyboard: TextInputType.number,
                        icon: Icons.call,
                      ),
                      Txtfield(
                        label: "Password",
                        hint: "Enter Your Password",
                        controller: passcon,
                        icon: Icons.password,
                        pass: true,
                      ),
                      Txtfield(
                        onTap: () {
                          setState(() {
                            chooseDate(context);
                          });
                        },
                        isVisible: true,
                        icon: Icons.calendar_month_outlined,
                        controller: datercon,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (!validate(
                                namecon.text.trim(), valuetype.name)) {
                              print("Data Not Valid");
                            } else if (!validate(
                                emailcon.text.trim(), valuetype.email)) {
                              print("Data Not Valid");
                            } else if (!validate(
                                numbercon.text.trim(), valuetype.phone)) {
                              print("Data Not Valid");
                            } else if (!validate(
                                passcon.text.trim(), valuetype.password)) {
                              print("Data Not Valid");
                            } else {
                              showMsg("Value Added !!");
                              model.add(Model(namecon.text, numbercon.text,
                                  emailcon.text, date, time, passcon.text));
                              namecon.clear();
                              numbercon.clear();
                              emailcon.clear();
                              date = DateTime.now();
                              time = TimeOfDay.now();
                            }
                          },
                          child: const Icon(Icons.add)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Page2(model: model),
                    ));
                  },
                  child: const Text("View Details"))
            ],
          ),
        ),
      ),
    );
  }
}
