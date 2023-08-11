import 'package:flutter/material.dart';
import '../widgets/quiz_tab.dart';
import '../widgets/result_tab.dart';

class TabNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs (Quiz and Result)
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.orange[400], // Background color of the tab bar
              child: TabBar(
                indicatorColor: Color.fromARGB(255, 26, 25, 25), // Color of the selected tab indicator
                labelColor: const Color.fromARGB(255, 0, 0, 0), // Color of the selected tab label text
                unselectedLabelColor: Color.fromARGB(255, 39, 35, 35), // Color of the unselected tab label text
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