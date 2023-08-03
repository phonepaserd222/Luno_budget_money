// import 'package:flutter/material.dart';

// class TabView extends StatelessWidget {
//   const TabView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: DefaultTabController(
//         length: 3,
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey),
//                 // borderRadius: BorderRadius.circular(30),
//               ),
//               child: const TabBar(
//                 labelColor: Colors.green, //<-- selected text color
//                 unselectedLabelColor: Colors.black, //<-- Unselected text color
//                 indicator: BoxDecoration(
//                   border: Border(
//                     top: BorderSide(color: Colors.green, width: 3),
//                   ),
//                 ),

//                 tabs: [
//                   Tab(
//                     icon: ImageIcon(
//                       AssetImage('assets/images/beranda.png'),
//                     ),
//                     text: 'Home',
//                   ),
//                   Tab(
//                     icon: ImageIcon(
//                       AssetImage('assets/images/beranda.png'),
//                     ),
//                     text: 'Home',
//                   ),
//                   Tab(
//                     icon: ImageIcon(
//                       AssetImage('assets/images/beranda.png'),
//                     ),
//                     text: 'Home',
//                   ),
//                 ],
//               ),
//             ),
//             const Expanded(
//               child: TabBarView(
//                 children: [
//                   // // 1
//                   // DetailButtonTab(),
//                   // //  2
//                   // ListOrder(),
//                   // // 3
//                   // DetailButtonTab(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
