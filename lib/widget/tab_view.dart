import 'package:flutter/material.dart';
import 'package:luno_budget_money/screens/page/page_category.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue),
                labelStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                tabs: const [
                  Tab(
                      child: Text(
                    'Daily',
                    style: TextStyle(color: Colors.grey),
                  )),
                  Tab(
                      child: Text(
                    'Weekly',
                    style: TextStyle(color: Colors.grey),
                  )),
                  Tab(
                      child: Text(
                    'Monthly',
                    style: TextStyle(color: Colors.grey),
                  )),
                  Tab(
                      child: Text(
                    'yearly',
                    style: TextStyle(color: Colors.grey),
                  )),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  // // 1
                  PageCategory(),
                  // //  2
                  PageCategory(),
                  // // 3
                  PageCategory(),
                  PageCategory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
