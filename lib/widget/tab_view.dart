import 'package:flutter/material.dart';
import 'package:luno_budget_money/screens/tabview/daily_tab.dart';
import 'package:luno_budget_money/screens/tabview/monthly_tab.dart';
import 'package:luno_budget_money/screens/tabview/weekly_tab.dart';
import 'package:luno_budget_money/screens/tabview/yearly_tab.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 226, 184),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: TabBar(
                  indicator: BoxDecoration(
                      border: Border.all(color: Colors.blue),

                      // borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  labelStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(
                        child: Text(
                      'Daily',
                      style: TextStyle(color: Colors.black),
                    )),
                    Tab(
                        child: Text(
                      'Weekly',
                      style: TextStyle(color: Colors.black),
                    )),
                    Tab(
                        child: Text(
                      'Monthly',
                      style: TextStyle(color: Colors.black),
                    )),
                    Tab(
                        child: Text(
                      'yearly',
                      style: TextStyle(color: Colors.black),
                    )),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    // // 1
                    DailyTab(),
                    // // //  2
                    WeeklyTab(),
                    // // // 3
                    MonthlyTab(),
                    // 4
                    YearlyTab()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
