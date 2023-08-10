import 'package:flutter/material.dart';

import '../../services/api_get_category_expense.dart';

class YearlyTab extends StatelessWidget {
  const YearlyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ApiGetCategoryExpense().getCategoryExpense(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
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
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                const Column(
                                  children: [
                                    CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.amber,
                                        backgroundImage: NetworkImage(
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/'
                                            '65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png')),
                                    Text('no more'),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('${snapshot.data?[index].title}'),
                                Text('${snapshot.data?[index].amount}'),
                              ],
                            ),
                          ),
                        ]));
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
// 
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class YearlyTab extends StatefulWidget {
//   const YearlyTab({super.key});

//   @override
//   YearlyTabState createState() => YearlyTabState();
// }

// class YearlyTabState extends State<YearlyTab> {
//   late SharedPreferences prefs;
//   String? storedValue;

//   @override
//   void initState() {
//     super.initState();
//     initializePreferences();
//   }

//   Future<void> initializePreferences() async {
//     prefs = await SharedPreferences.getInstance();
//     setState(() {
//       storedValue = prefs.getString('key');
//     });
//   }

//   Future<void> storeValue(String value) async {
//     await prefs.setString('key', value);
//     setState(() {
//       storedValue = value;
//     });
//   }

//   Future<void> removeValue() async {
//     await prefs.remove('key');
//     setState(() {
//       storedValue = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shared Preferences Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Stored value:',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               storedValue ?? 'No value',
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => storeValue('Hello, World!'),
//               child: const Text('Store Value'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: removeValue,
//               child: const Text('Remove Value'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
