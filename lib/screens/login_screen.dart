import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:luno_budget_money/services/auth_service.dart';

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const Text(
                      //   'ອີເມວ',
                      //   style: TextStyle(fontSize: 20),
                      // ),
                      const SizedBox(height: 150),
                      Text(
                        "Welcome Back",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Login to your account",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 60),
                      TextFormField(
                        validator: MultiValidator([
                          EmailValidator(errorText: 'ກອກອີເມວບໍ່ຖືກຕ້ອງ'),
                          RequiredValidator(errorText: 'ກະລຸນາກອກ ອີເມວ'),
                        ]),
                        decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (email) {
                          profile.email = email!;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // const Text(
                      //   'ລະຫັດຜ່ານ',
                      //   style: TextStyle(fontSize: 20),
                      // ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.password_outlined),
                            // suffixIcon: const Icon(Icons.visibility_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        validator:
                            RequiredValidator(errorText: 'ກະລຸນາກອກ ລະຫັດ'),
                        obscureText: true,
                        onSaved: (password) {
                          profile.password = password!;
                        },
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Login',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              formkey.currentState?.reset();

                              Navigator.pushNamed(context, Routes.register);
                            },
                            child: const Text("Signup"),
                          ),
                        ],
                      ),
                      // InkWell(
                      //   onTap: () => AuthService().signInWithGoogle(),
                      //   child: SizedBox(
                      //     height: 100,
                      //     width: 100,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Image.asset('assets/images/google2.png')
                      //       ],
                      //     ),
                      //   ),
                      // )
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
