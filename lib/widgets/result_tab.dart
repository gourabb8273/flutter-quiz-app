import 'package:flutter/material.dart';
import 'quiz_topic_content.dart';
import '../store/user.dart';
import 'package:provider/provider.dart';

class ResultTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizResponse =
        Provider.of<UserStore>(context, listen: false).userQuizResponse;

    // Sort quizResponse list by date
    quizResponse.sort((a, b) {
      DateTime dateA = DateTime.parse(a['date']);
      DateTime dateB = DateTime.parse(b['date']);
      return dateB.compareTo(dateA);
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10), // Add top margin
              if (quizResponse.isEmpty)
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 180),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(                    
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'No results available. Please start your quiz now.',
                    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 50, 49, 49)),
                    textAlign: TextAlign.center,
                  ),
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (var result in quizResponse)
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
                                value: double.parse(result['percentage']) / 100,
                                strokeWidth: 5,
                                backgroundColor: Colors.grey.shade300,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.orange),
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${result['topic']}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Percentage: ${result['percentage']}%',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Attempted on ${result['date']}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: result['isPass'] ? Colors.green : Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                result['isPass'] ? 'Pass' : 'Fail',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
