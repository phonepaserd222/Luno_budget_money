import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:luno_budget_money/routes/routes.dart';

import '../models/profile.dart';
// import 'package:firebase_auth_platform_interface/src/method_channel/method_channel_firebase_auth.dart'

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('error'),
            ),
            body: Center(
              child: Text('${snapshot.error}'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Create User'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ອີເມວ',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: MultiValidator([
                            EmailValidator(errorText: 'ກອກອີເມວບໍ່ຖືກຕ້ອງ'),
                            RequiredValidator(errorText: 'ກະລຸນາກອກ ອີເມວ'),
                          ]),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (email) {
                            profile.email = email!;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'ລະຫັດຜ່ານ',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator:
                              RequiredValidator(errorText: 'please password'),
                          obscureText: true,
                          onSaved: (password) {
                            profile.password = password!;
                          },
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            child: const Text(
                              'register',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState?.save();
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: profile.email,
                                          password: profile.password)
                                      .then((value) {
                                    Fluttertoast.showToast(
                                        msg: "ສ້າງບັນຊີສຳເລັດແລ້ວ",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.black,
                                        fontSize: 16.0);
                                    formkey.currentState?.reset();
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacementNamed(
                                        context, Routes.home);
                                  });
                                } on FirebaseAuthException catch (e) {
                                  // ignore: avoid_print
                                  print(e.code);
                                  String message;
                                  if (e.code == 'email-already-in-use') {
                                    message = 'ອີເມວຖືກໃຊ້ແລ້ວ';
                                  } else if (e.code == 'weak-password') {
                                    message =
                                        'ລະຫັດຜ່ານຕ້ອງມີຄວາມຍາວ 6 ໂຕຂື້ນໄປ';
                                  } else {
                                    message = e.message!;
                                  }
                                  Fluttertoast.showToast(
                                      msg: message,
                                      gravity: ToastGravity.CENTER);
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
