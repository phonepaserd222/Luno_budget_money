import 'package:flutter/material.dart';
import '../../constants/image_contants.dart';
import '../../services/api_get_category.dart';

class WeeklyTab extends StatelessWidget {
  const WeeklyTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final ResponseGetCategoryScreen dataweek;
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      // TO do add return type
      body: FutureBuilder(
        future: ApiGetCategory().getCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // const Text('data'),
                      Text('${snapshot.data?[index].categoryName} '),
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            // '${snapshot.data?[index].image}'
                            '${ImageConstants.iconCtgLink1}${snapshot.data?[index].image}${ImageConstants.iconCtgLink2}',
                          )),
                    ],
                  );
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
      ),
    );
  }
}
