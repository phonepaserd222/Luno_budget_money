import 'package:flutter/material.dart';
import 'package:luno_budget_money/widget/alert_dialog_yes_no.dart';

class PageCategory extends StatelessWidget {
  const PageCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Category'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                // backgroundImage: NetworkImage(
                //     'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/No_icon_red.svg/1024px-No_icon_red.svg.png'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 35,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.purple)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Upload Icon'), Icon(Icons.file_upload_outlined)],
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text('Icon name'),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SizedBox(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  // labelText: 'Email',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 5, right: 5),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        onPressed: () {},
                        child: const Text('Add')),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // ignore: prefer_const_constructors

                    borderRadius: BorderRadius.circular(3),
                    borderSide:
                        const BorderSide(width: 1, color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Colors.purple),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text('Icon list'),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.purple)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.amber,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Donut'),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        DialogYesNO(context: context);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
