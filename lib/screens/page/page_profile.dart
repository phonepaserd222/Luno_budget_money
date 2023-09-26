import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luno_budget_money/constants/color_contants.dart';
import 'package:luno_budget_money/services/api_get_user.dart';
import 'package:luno_budget_money/services/api_update_user.dart';
import 'package:luno_budget_money/widget/function_logout.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../constants/image_contants.dart';
// import '../../widget/function_signout.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({super.key});

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<String?> uploadImageToFirebase(File imageFile) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final reference =
          firebase_storage.FirebaseStorage.instance.ref().child(fileName);

      final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg', // Adjust the content type if necessary
      );
      final uploadTask = reference.putFile(imageFile, metadata);
      final snapshot = await uploadTask.whenComplete(() {});
      ApiUpdateUser().updateUser(image: fileName);

      final downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      debugPrint('Error uploading image to Firebase: $e');
      return null;
    }
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User?;
    return Scaffold(
      backgroundColor: ColorConstants.bgwhite, //#FFFCEF
      appBar: AppBar(
        backgroundColor: ColorConstants.colors4, //#FFFCEF
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          'Account Setting',
          style: TextStyle(color: ColorConstants.bgwhite),
        ),
      ),
      body: FutureBuilder(
        future: ApiGetUser().getUser(),
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        _image == null
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                  user?.photoURL ??
                                      "${ImageConstants.iconCtgLink1}${snapshot.data?.image}${ImageConstants.iconCtgLink2}",
                                ),
                              )
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(_image!),
                              ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () async {
                                await _getImage(ImageSource.gallery)
                                    .then((value) {
                                  uploadImageToFirebase(_image!);
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                  color: ColorConstants.colors3,
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' ${snapshot.data?.userName ?? '${user?.displayName}'}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            ' ${user?.email ?? ''}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //
              // user name
              //
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 225, 164, 236),
                              border: Border.all(
                                color: const Color.fromARGB(255, 225, 164, 236),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text('User name',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                    // const SizedBox(width: 100),
                    Expanded(
                      flex: 2,
                      child: Text(
                        ' ${snapshot.data?.userName ?? '${user?.displayName}'}',
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 80, right: 15),
                child: Divider(color: Colors.black),
              ),
              const SizedBox(height: 30),
              //
              // Email
              //
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 225, 164, 236),
                              border: Border.all(
                                color: const Color.fromARGB(255, 225, 164, 236),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.email_outlined,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text('Email', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                    // const SizedBox(width: 50),
                    Expanded(
                      flex: 3,
                      child: Text(
                        ' ${user?.email ?? '${snapshot.data?.googleId}'}',
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 80, right: 15),
                child: Divider(color: Colors.black),
              ),
              // const SizedBox(height: 32),
              const SizedBox(height: 30),
              //
              // logout
              //
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, right: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     // crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Row(
              //         children: [
              //           Container(
              //             height: 45,
              //             width: 45,
              //             decoration: BoxDecoration(
              //               color: const Color.fromARGB(255, 225, 164, 236),
              //               border: Border.all(
              //                 color: const Color.fromARGB(255, 225, 164, 236),
              //               ),
              //               borderRadius: BorderRadius.circular(8),
              //             ),
              //             child: const Icon(
              //               Icons.logout_outlined,
              //               size: 40,
              //             ),
              //           ),
              //           const SizedBox(width: 10),
              //           TextButton(
              //               onPressed: () => signOut(context),
              //               child: const Text(
              //                 'LogOut',
              //                 style: TextStyle(fontSize: 20),
              //               )),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => LogOutUser(context),
                // _signOut(context),
                child: const Text('Sign Out'),
              ),
            ],
          );
        },
      ),
    );
  }
}
