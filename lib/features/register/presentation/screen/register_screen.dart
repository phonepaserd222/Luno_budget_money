import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:luno_budget_money/features/register/data/services/api_register_by_userpass.dart';

import '../../../../constants/color_contants.dart';
import '../../../../routes/routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: ColorConstants.bgwhite, //#FFFCEF
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // 3
                const SizedBox(height: 150),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            controller: userNameController,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please enter username'),
                            ]),
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              // prefixIcon: Icon(Icons.person),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              // prefixIcon: Icon(Icons.password_outlined),
                            ),
                            validator: RequiredValidator(
                                errorText: 'Please enter password'),
                            obscureText: true,
                          ),
                          // TextFormField(
                          //   decoration: const InputDecoration(
                          //     labelText: 'Confirm Password',
                          //     // prefixIcon: Icon(Icons.password_outlined),
                          //   ),
                          //   validator:
                          //       RequiredValidator(errorText: 'ກະລຸນາກອກ ລະຫັດ'),
                          //   obscureText: true,
                          // ),
                          const SizedBox(height: 30),
                          SizedBox(
                            height: 50,
                            width: 319,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(35),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Register',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ApiRegisterByUserpass.registerByUserpass(
                                    userName: userNameController.text,
                                    passwords: passwordController.text,
                                    context: context,
                                  ).then((value) {
                                    userNameController.clear();
                                    passwordController.clear();
                                    Navigator.pushNamed(context, Routes.login);
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(bottom: 30, top: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.grey,
                      )),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "or",
                          style: TextStyle(
                              color: Color.fromARGB(255, 182, 180, 180)),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.grey,
                      ))
                    ],
                  ),
                ),
//
                // InkWell(
                //   onTap: () => AuthService().signInWithGoogle(context),
                //   child: Container(
                //     height: 50,
                //     width: 350,
                //     decoration: BoxDecoration(
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.grey.withOpacity(0.5),
                //           spreadRadius: 5,
                //           blurRadius: 7,
                //           offset:
                //               const Offset(0, 3), // changes position of shadow
                //         ),
                //       ],
                //       color: Colors.white,
                //       border: Border.all(color: Colors.white),
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         SizedBox(
                //           height: 40,
                //           width: 40,
                //           child: Image.asset(ImageConstants.logoGoogle),
                //         ),
                //         const SizedBox(width: 10),
                //         const Text('Connect With Google'),
                //       ],
                //     ),
                //   ),
                // ),
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.login);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}