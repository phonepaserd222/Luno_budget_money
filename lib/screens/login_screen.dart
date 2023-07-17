import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../models/profile.dart';
import '../routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              title: const Text('ເຂົ້າສູ່ລະບົບ'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formkey,
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
                            RequiredValidator(errorText: 'ກະລຸນາກອກ ລະຫັດ'),
                        obscureText: true,
                        onSaved: (password) {
                          profile.password = password!;
                        },
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          child: const Text(
                            'ເຂົ້າລະບົບ',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState?.save();
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: profile.email,
                                        password: profile.password)
                                    .then((value) {
                                  Fluttertoast.showToast(msg: 'ກຳລັງເຂົ້າ');
                                  formkey.currentState?.reset();
                                  Navigator.pushReplacementNamed(
                                      context, Routes.welcome);
                                });
                              } on FirebaseAuthException catch (e) {
                                Fluttertoast.showToast(
                                    msg: e.message!,
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
