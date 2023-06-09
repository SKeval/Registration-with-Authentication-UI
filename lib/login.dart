import 'package:flutter/material.dart';

enum ValidTypes { email, pass, phone, name }

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
//cont
  TextEditingController emaiCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  addInput(
    String hint, {
    TextInputType keyType = TextInputType.text,
    required TextEditingController controller,
    bool isPass = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: TextField(
        controller: controller,
        keyboardType: keyType,
        decoration: InputDecoration(
          hintText: hint,
          labelText: hint,
        ),
        obscureText: isPass,
      ),
    );
  }

  showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
      ),
    );
  }

  bool isDataValid(String value, ValidTypes type) {
    // 1 = email
    //2 = password
    String regEmail =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    bool isValid = true;

    switch (type) {
      case ValidTypes.email:
        if (value.isEmpty) {
          showMsg('Email is empty');
          isValid = false;
        }
        if (!RegExp(regEmail).hasMatch(value)) {
          showMsg('Email is not Valid');
          isValid = false;
        }

        break;

      case ValidTypes.pass:
        if (value.isEmpty) {
          showMsg('Password is empty');
          isValid = false;
        }

        if (value.length < 8) {
          showMsg('Password should be more than 8 Chars');
          isValid = false;
        }

        break;

      default:
        isValid = true;
        break;
    }

    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Column(
        children: [
          addInput('Enter Email',
              keyType: TextInputType.emailAddress, controller: emaiCont),
          addInput('Enter Password',
              keyType: TextInputType.text,
              controller: passwordCont,
              isPass: true),
          Padding(
            padding: const EdgeInsets.all(14),
            child: ElevatedButton(
                onPressed: () {
                  if (isDataValid(emaiCont.text.trim(), ValidTypes.email)) {
                    print('Data IS valid');
                  }
                  if (isDataValid(passwordCont.text.trim(), ValidTypes.pass)) {
                    print('Password Data IS valid');
                  } else {
                    print('Data is Not Valid');
                  }
                },
                child: Text('Login')),
          )
        ],
      ),
    );
  }
}
