import 'package:flutter/material.dart';
import 'package:luno_budget_money/screens/page/page_tester.dart';

class MonthlyTab extends StatefulWidget {
  const MonthlyTab({super.key});

  @override
  State<MonthlyTab> createState() => _MonthlyTabState();
}

class _MonthlyTabState extends State<MonthlyTab> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: controllerName,
            decoration: InputDecoration(
              labelText: 'name',
              // prefixIcon: const Icon(Icons.calculate),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                    width: 1, color: Color.fromRGBO(112, 20, 204, 1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromRGBO(112, 20, 204, 1)),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 10),
          // 2
          TextFormField(
            controller: controllerAge,
            decoration: InputDecoration(
              labelText: 'age',
              // prefixIcon: const Icon(Icons.calculate),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                    width: 1, color: Color.fromRGBO(112, 20, 204, 1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromRGBO(112, 20, 204, 1)),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 10),
          // 3
          ElevatedButton(onPressed: () {}, child: const Text('Save')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Tester();
                  },
                ));
              },
              child: const Text('next'))
        ],
      ),
    );
  }
}
