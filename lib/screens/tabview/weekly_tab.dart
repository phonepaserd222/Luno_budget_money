import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          // Text('Im ok Bro')
          FutureBuilder(
            future: ApiGetCategory().getCategory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const Text('data'),
                          Text('${snapshot.data?[index].categoryName} '),
                          Image.network('${snapshot.data?[index].image}'),
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
          )
        ],
      ),
    );
  }
}
