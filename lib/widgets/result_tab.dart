import 'package:flutter/material.dart';

import 'quiz_topic_content.dart';
List<Map<String, dynamic>> quizResponse = [ {'topic':"NodeJS", "Percentange":"90" },{'topic':"Flutter", "Percentange":"80" }];
// class ResultTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Result Tab'),
//       // ),
//       body: Center(
//         child: Text('Result Content'),
//       ),
//     );
//   }
// }

class ResultTab extends StatelessWidget {
  final List<Map<String, dynamic>> quizResponse = [
    {'topic': 'NodeJS', 'percentage': '90', 'date': '2023-08-10'},
    {'topic': 'Flutter', 'percentage': '80', 'date': '2023-08-11'},
    {'topic': 'React', 'percentage': '45', 'date': '2023-08-12'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Remove AppBar height
        child: AppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var details in quizResponse)
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        value: double.parse(details['percentage']) / 100,
                        strokeWidth: 5,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${details['topic']}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Percentage: ${details['percentage']}%',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          'Attempted on ${details['date']}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: double.parse(details['percentage']) >= 50
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        double.parse(details['percentage']) >= 50 ? 'Pass' : 'Fail',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}