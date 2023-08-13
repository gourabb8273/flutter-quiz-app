import 'package:flutter/material.dart';
import '../widgets/quiz_tab.dart';
import '../widgets/result_tab.dart';

class TabNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.orange[400], 
              child: TabBar(
                indicatorColor: Color.fromARGB(255, 26, 25, 25), 
                labelColor: const Color.fromARGB(255, 0, 0, 0), 
                unselectedLabelColor: Color.fromARGB(255, 39, 35, 35),
                tabs: [
                  Tab(
                    text: 'Quiz',
                  ),
                  Tab(
                    text: 'Result',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  QuizTab(),
                  ResultTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}