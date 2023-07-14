import 'package:flutter/material.dart';
import 'package:luno_budget_money/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register/Login'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: size.width * 0.8,
                    width: size.width * 0.8,
                    child: Image.asset('assets/images/Budget-Planning.jpg')),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.register);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('ສ້າງບັນຊີຜູ້ໃຊ້')),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.login);
                    },
                    icon: const Icon(Icons.login),
                    label: const Text('ເຂົ້າສູ່ລະບົບ')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
