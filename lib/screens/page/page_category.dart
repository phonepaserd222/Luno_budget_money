import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:image_picker/image_picker.dart';
import 'package:luno_budget_money/services/api_delete_category.dart';

import '../../constants/color_contants.dart';
import '../../constants/image_contants.dart';
import '../../services/api_get_category_find_many.dart';
import '../../services/api_post_category.dart';

class PageCategory extends StatefulWidget {
  const PageCategory({Key? key}) : super(key: key);

  @override
  State<PageCategory> createState() => PageCategoryState();
}

class PageCategoryState extends State<PageCategory> {
  final TextEditingController iconNameController = TextEditingController();

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
      final fileName = iconNameController.text.trim();
      final reference =
          firebase_storage.FirebaseStorage.instance.ref().child(fileName);

      final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg', // Adjust the content type if necessary
      );
      final uploadTask = reference.putFile(imageFile, metadata);
      final snapshot = await uploadTask.whenComplete(() {});
      ApiPostCategory.createCategory(
          categoryName: iconNameController.text.trim(), image: fileName);
      final downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      debugPrint('Error uploading image to Firebase: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.bgwhite,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Category'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null
                      ? const CircleAvatar(
                          radius: 65.0,
                          backgroundImage: NetworkImage(
                              'https://www.rfalliance.org.za/wp-content/uploads/2022/12/no-picture-available-icon-1.png'),
                        )
                      : CircleAvatar(
                          radius: 65.0,
                          backgroundImage: FileImage(_image!),
                        ),
                ],
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => _getImage(ImageSource.gallery),
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.purple)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Select Icon',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.file_upload_outlined)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text(
                      'Icon name',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 35,
                        width: 250,
                        child: TextFormField(
                          controller: iconNameController,
                          decoration: InputDecoration(
                            suffixIcon: const Padding(
                              padding:
                                  EdgeInsets.only(bottom: 5, top: 5, right: 5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.purple),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.purple),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.colors3),
                        onPressed: () async {
                          // String fileName = genName;
                          String iconName = iconNameController.text.trim();
                          if (iconName.isNotEmpty && _image != null) {
                            // String? imageUrl =6
                            uploadImageToFirebase(_image!).then((value) {
                              if (value == null) {
                              } else {
                                _image = null;
                                iconNameController.clear();
                              }
                            });
                          }
                        },
                        child: const Text('Add'),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text(
                      'Icon list',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: FutureBuilder(
                future: ApiGetCategoryFindMany().getCategoryFindMany(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.purple)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: ColorConstants.colors3,
                                    backgroundImage: NetworkImage(
                                        '${ImageConstants.iconCtgLink1}${snapshot.data?[index].image}${ImageConstants.iconCtgLink2}'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("${snapshot.data?[index].categoryName}"),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Delete ?'),
                                      actions: [
                                        MaterialButton(
                                          child: const Text('No'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        MaterialButton(
                                          child: const Text('Yes'),
                                          onPressed: () async {
                                            // Remove item from list
                                            await ApiDeleteCategory()
                                                .deleteCategory(
                                                    id: snapshot
                                                        .data![index].id)
                                                .then((value) {
                                              Navigator.of(context).pop();
                                            });
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
