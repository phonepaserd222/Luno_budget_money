import 'package:flutter/material.dart';
import 'package:luno_budget_money/screens/page/page_category.dart';
import 'package:luno_budget_money/screens/page/page_home.dart';

import '../screens/page/page_profile.dart';
// import 'package:luno_budget_money/screens/page/page_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    // pages Home
    const PageHome(),
    // pages Home
    const PageCategory(),
    // PageImages(),
    // pages Home
    const PageProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        backgroundColor: const Color.fromRGBO(112, 20, 204, 1),
      ),
    );
  }
}

//
//
//
//

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   // final User user;

//   const HomeScreen({Key? key}) : super(key: key);

//   // void _signOut(BuildContext context) async {
//   //   try {
//   //     final GoogleSignIn _googleSignIn = GoogleSignIn();
//   //     await _googleSignIn.disconnect();
//   //     await FirebaseAuth.instance.signOut();
//   //     // Navigator.pop(context);
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final user = ModalRoute.of(context)!.settings.arguments as User;
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 246, 226, 184), //#FFFCEF
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 246, 226, 184), //#FFFCEF
//         // centerTitle: true,
//         title: const Text('LUNO Budget Buddy'),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: CircleAvatar(
//               radius: 30,
//               backgroundImage: NetworkImage(user.photoURL!),
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(user.photoURL!),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Welcome, ${user.displayName} sama',
//               style: const TextStyle(fontSize: 24),
//             ),
//             const SizedBox(height: 32),
//           ],
//         ),
//       ),
//     );
//   }
// }
