import 'package:flutter/material.dart';
import '../../routes/routes.dart';
import '../../widget/date_home.dart';

class PageHome extends StatelessWidget {
  const PageHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Luno budget buddy'),
        actions: const [
          SizedBox(
            child: Icon(
              Icons.person,
              size: 40,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Datehome(), // Add the MyRowWithContainers widget here
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text('Start Date'),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 90,
                      height: 44,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromRGBO(112, 20, 204, 1))),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 18,
                    child: const Divider(
                      color: Colors.black, // Customize the color of the divider
                      // height: 30, // Set the height of the divider
                      // thickness: 3, // Set the thickness of the divider
                      // indent: 20, // Set the left indent of the divider
                      // endIndent: 20, // Set the right indent of the divider
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('End Date'),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 90,
                      height: 44,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromRGBO(112, 20, 204, 1))),
                    )
                  ],
                ),
                SizedBox(
                  width: 18,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Container(
                    width: 90,
                    height: 44,
                    // color: const Color.fromRGBO(152, 111, 249, 1),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(152, 111, 249, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Search',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Date of Category'), Text('Total: 200000')],
            ),
          ),
          const Divider(
            color: Colors.black, // Customize the color of the divider
          ),
          SizedBox(
            height: 40,
          ),
          const Divider(
            color: Colors.black, // Customize the color of the divider
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.expensescreen);
            },
            child: Text('Go to Expense Screen'),
          ),
        ],
      ),
    );
  }
}
