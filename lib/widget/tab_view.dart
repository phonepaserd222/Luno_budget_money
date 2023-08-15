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
      backgroundColor: const Color.fromRGBO(255, 252, 239, 1),
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(5),
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
