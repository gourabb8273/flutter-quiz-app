import 'package:flutter/material.dart';
import 'quiz_topic_content.dart';
import 'package:provider/provider.dart';
import 'quiz_question.dart';
import '../store/quiz.dart';

class QuizTab extends StatefulWidget {
  @override
  _QuizTabState createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<QuizStore>(
        builder: (context, quizStore, _) {
          int currentQuestionIndex = quizStore.currentQuestionIndex;
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: quizStore.quizTopics.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> topicData = quizStore.quizTopics[index];
              return GestureDetector(
                onTap: () =>
                    _showStartQuizConfirmation(context, topicData, quizStore),
                child: QuizTopicWidget(
                  topic: topicData['topic'],
                  numberOfQuestions: topicData['numberOfQuestions'],
                  difficultyLevels: topicData['difficultyLevels'],
                  passMarksPercentage: topicData['passMarksPercentage'],
                  logoPath: topicData['logoPath'],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showStartQuizConfirmation(BuildContext context,
      Map<String, dynamic> topicData, QuizStore quizStore) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Start Quiz'),
          content: Text(
              'Are you sure you want to start the quiz for ${topicData['topic']}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _navigateToQuizQuestion(context, topicData, quizStore);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToQuizQuestion(BuildContext context,
      Map<String, dynamic> topicData, QuizStore quizStore) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizQuestionWidget(
          topic: topicData['topic'],
        ),
      ),
    );
  }
}
