import 'package:flutter/material.dart';

class ExpenScreen extends StatefulWidget {
  const ExpenScreen({super.key});

  @override
  State<ExpenScreen> createState() => _ExpenScreenState();
}

class _ExpenScreenState extends State<ExpenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         child: SizedBox(
            //             height: 80,
            //             width: 80,
            //             child:
            //                 Image.asset('assets/images/Budget-Planning.jpg')),
            //       ),
            //       const Text('deta', style: TextStyle(fontSize: 30)),
            //       const Icon(Icons.arrow_forward_ios),
            //     ],
            //   ),
            // ),

            // T2
            const SizedBox(
              height: 15,
            ),

            // T1 Date
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2.5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 215, 215),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.calendar_today),
                    Text('Select Date'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),

            // T2  Cost
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2.5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 215, 215),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.attach_money),
                    Text('Enter Cost'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),

            // T3
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2.5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 215, 215),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.category),
                    Text('Select Category'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            // T4
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2.5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 215, 215),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.calculate),
                    Text('Total'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),

            // Container(
            //   height: 110,
            //   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     color: const Color.fromARGB(255, 241, 116, 116),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         height: 80,
            //         width: 80,
            //         child: Image.asset('assets/images/Budget-Planning.jpg'),
            //       ),
            //       const Text('deta', style: TextStyle(fontSize: 30)),
            //       const Padding(
            //         padding: EdgeInsets.symmetric(vertical: 5),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           children: [
            //             Icon(Icons.arrow_forward_ios),
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
