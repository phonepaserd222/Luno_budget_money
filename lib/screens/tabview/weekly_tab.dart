import 'package:flutter/material.dart';

class WeeklyTab extends StatelessWidget {
  const WeeklyTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final ResponseGetCategoryScreen dataweek;
    return const Column(
      children: [
        Text('Im ok Bro')
        // FutureBuilder(
        //   future: ApiGetCategory().getCategory(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       if (snapshot.hasData) {
        //         return ListView.builder(
        //           itemBuilder: (context, index) {
        //             return Card(
        //               child: ListTile(
        //                 title: Text(snapshot.data!.categoryName),
        //                 subtitle: Image.network(snapshot.data!.image),
        //               ),
        //             );
        //           },
        //         );
        //       } else {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //     } else {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // )
      ],
    );
  }
}
