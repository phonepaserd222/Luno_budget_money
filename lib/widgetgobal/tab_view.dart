import 'package:flutter/material.dart';
import 'package:luno_budget_money/constants/color_contants.dart';
import 'package:luno_budget_money/features/homescreen/presentation/tabview/daily_tab.dart';
import 'package:luno_budget_money/features/homescreen/presentation/tabview/monthly_tab.dart';
import 'package:luno_budget_money/features/homescreen/presentation/tabview/weekly_tab.dart';
import 'package:luno_budget_money/features/homescreen/presentation/tabview/yearly_tab.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 252, 239, 1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: ColorConstants.colors4, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                      border:
                          Border.all(color: ColorConstants.colors4, width: 2),
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white),
                  labelStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
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
                      overflow: TextOverflow.ellipsis,
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
                    YearlyTab(),
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
