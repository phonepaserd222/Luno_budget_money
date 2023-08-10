// import 'package:flutter/material.dart';

// class YearlyTab extends StatelessWidget {
//   const YearlyTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('YEARLY'),
//     );
//   }
// }

//
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YearlyTab extends StatefulWidget {
  const YearlyTab({super.key});

  @override
  YearlyTabState createState() => YearlyTabState();
}

class YearlyTabState extends State<YearlyTab> {
  late SharedPreferences prefs;
  String? storedValue;

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      storedValue = prefs.getString('key');
    });
  }

  Future<void> storeValue(String value) async {
    await prefs.setString('key', value);
    setState(() {
      storedValue = value;
    });
  }

  Future<void> removeValue() async {
    await prefs.remove('key');
    setState(() {
      storedValue = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Stored value:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              storedValue ?? 'No value',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => storeValue('Hello, World!'),
              child: const Text('Store Value'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: removeValue,
              child: const Text('Remove Value'),
            ),
          ],
        ),
      ),
    );
  }
}
