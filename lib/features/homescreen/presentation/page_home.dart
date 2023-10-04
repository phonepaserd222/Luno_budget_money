import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:luno_budget_money/widgetgobal/tab_view.dart';

import '../../../constants/image_contants.dart';
import '../../profile/data/service/api_get_user.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User?;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 252, 239, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Luno budget buddy'),
        actions: [
          FutureBuilder(
            future: ApiGetUser().getUser(),
            builder: (context, snapshot) {
              return CircleAvatar(
                backgroundImage: NetworkImage(
                    user?.photoURL ??
                        "${ImageConstants.iconCtgLink1}${snapshot.data?.image}${ImageConstants.iconCtgLink2}",
                    scale: 1.0),
              );
            },
          ),
          const SizedBox(
            width: 30,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(30),
                  //     topRight: Radius.circular(30)),
                ),
                child: const TabView(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// 
// 
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../../routes/routes.dart';
// import '../../widget/date_home.dart';

// class PageHome extends StatelessWidget {
//   const PageHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = ModalRoute.of(context)!.settings.arguments as User?;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Luno budget buddy'),
//         actions: [
//           CircleAvatar(
//             backgroundImage: NetworkImage(user?.photoURL ??
//                 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png'),
//           ),
//           const SizedBox(
//             width: 30,
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(top: 35),
//             child: Datehome(),
//           ), // Add the MyRowWithContainers widget here
//           const SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Column(
//                   children: [
//                     const Text('Start Date'),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       width: 95,
//                       height: 44,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(
//                               color: const Color.fromRGBO(112, 20, 204, 1))),
//                     )
//                   ],
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(5),
//                   child: SizedBox(
//                     width: 18,
//                     child: Divider(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     const Text('End Date'),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       width: 95,
//                       height: 44,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(
//                               color: const Color.fromRGBO(112, 20, 204, 1))),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   width: 18,
//                 ),
//                 Container(
//                   width: 95,
//                   height: 44,
//                   margin: const EdgeInsets.only(top: 25),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(5),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           elevation: 0.0,
//                           shadowColor: Colors.transparent,
//                           backgroundColor:
//                               const Color.fromRGBO(152, 111, 249, 1)),
//                       onPressed: () {},
//                       child: const Text(
//                         'Search',
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const Padding(
//             padding: EdgeInsets.all(28),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [Text('Date of Category'), Text('Total: 200000')],
//             ),
//           ),
//           const Divider(
//             color: Colors.black, // Customize the color of the divider
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           const Divider(
//             color: Colors.black, // Customize the color of the divider
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               Navigator.pushNamed(context, Routes.expensescreen);
//             },
//             child: const Icon(
//               Icons.add,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }