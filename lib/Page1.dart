// ignore_for_file: must_call_super, duplicate_ignore, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profilelists/Common/ShowMsg.dart';
import 'package:profilelists/Common/Txtfield.dart';
import 'package:profilelists/Model.dart';
import 'package:profilelists/Page2.dart';

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
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  String Dateformat(DateTime date) {
    DateFormat formatter = DateFormat('dd-MMM-yyyy    h : m : s');
    return formatter.format(date);
  }

  choosetime(BuildContext context) async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      time = value!;
    });
    ;
  }

  chooseDate(BuildContext context) async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1990),
            lastDate: DateTime.now())
        .then((value) {
      date = value!;
    });
  }

  // ignore: must_call_super
  @override
  void dispose() {
    namecon.dispose();
    emailcon.dispose();
    numbercon.dispose();
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
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 202, 156, 136),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                width: 350,
                height: 510,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const CircleAvatar(
                                  child: Icon(Icons.calendar_month_outlined),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          choosetime(context);
                                          chooseDate(context);
                                        });
                                      },
                                      child: Text(
                                          "${date.day}-${date.month}-${date.year}      ${time.format(context)}")),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (namecon.text.isNotEmpty) {
                                if (namecon.text.contains(r'[0-9]')) {
                                  showMsg("Please Write Your Name Correctly");
                                  return;
                                }
                              } else {
                                showMsg("Please Write Your Name");
                                return;
                              }
                              if (emailcon.text.isNotEmpty) {
                              } else {
                                showMsg("Please Write Your Email");
                                return;
                              }
                              if (numbercon.text.isNotEmpty) {
                                if (namecon.text.contains(r'[a-z A-Z]')) {
                                  showMsg(
                                      "Please Write Your Mobile Number Correctly");
                                  return;
                                }
                              } else {
                                showMsg("Please Write Your Mobile Number");
                                return;
                              }

                              showMsg("Value Added !!");
                              model.add(Model(namecon.text, numbercon.text,
                                  emailcon.text, date, time));
                              namecon.clear();
                              numbercon.clear();
                              emailcon.clear();
                              date = DateTime.now();
                              time = TimeOfDay.now();
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => Page2(model: model),
                              // ));
                            });
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
