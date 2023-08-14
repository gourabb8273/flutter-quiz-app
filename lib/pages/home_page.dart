import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/user.dart';
import '../store/quiz.dart';
import '../widgets/quiz_tab.dart';
import '../widgets/result_tab.dart';

class TabNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizResponse =
        Provider.of<UserStore>(context, listen: false).userQuizResponse;
    final quizTopic =
        Provider.of<QuizStore>(context, listen: false).quizTopics;
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
                    text: 'Quiz (${quizTopic.length})',
                  ),
                  Tab(
                    text: 'Result (${quizResponse.length})',
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
