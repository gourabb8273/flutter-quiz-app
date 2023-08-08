import 'package:flutter/material.dart';
import 'quiz_topic_content.dart';
import 'quiz_question.dart';

List<Map<String, dynamic>> quizTopics = [
  {
    'topic': 'Node.js',
    'numberOfQuestions': 50,
    'difficultyLevels': ['Easy'],
    'passMarksPercentage': 85,
    'logoPath': 'assets/nodejs.png',
  },
  {
    'topic': 'React',
    'numberOfQuestions': 60,
    'difficultyLevels': ['Expert'],
    'passMarksPercentage': 95,
    'logoPath': 'assets/react.png',
  },
  {
    'topic': 'Flutter',
    'numberOfQuestions': 70,
    'difficultyLevels': ['Beginner'],
    'passMarksPercentage': 65,
    'logoPath': 'assets/flutter.png',
  },
  {
    'topic': 'AWS',
    'numberOfQuestions': 40,
    'difficultyLevels': ['Advanced'],
    'passMarksPercentage': 65,
    'logoPath': 'assets/aws.png',
  },
  {
    'topic': 'JavaScript',
    'numberOfQuestions': 10,
    'difficultyLevels': ['Advanced'],
    'passMarksPercentage': 65,
    'logoPath': 'assets/javascript.png',
  },
];

List<Map<String, dynamic>> quizQuestions = [
  {
    'topic': 'Node.js',
    'questions': [
      {
        'question': 'Question 1 for Node.js',
        'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      },
      {
        'question': 'Question 2 for Node.js',
        'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      },
      // Add more questions for Node.js
    ],
  },
  {
    'topic': 'React',
    'questions': [
      {
        'question': 'Question 1 for React',
        'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      },
      {
        'question': 'Question 2 for React',
        'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      },
      // Add more questions for React
    ],
  },
  // Add more topics and their questions
];

class QuizTab extends StatefulWidget {
  @override
  _QuizTabState createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  int _currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: quizTopics.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> topicData = quizTopics[index];
          return GestureDetector(
            onTap: () => navigateToQuizQuestion(context, topicData),
            child: QuizTopicWidget(
              topic: topicData['topic'],
              numberOfQuestions: topicData['numberOfQuestions'],
              difficultyLevels: List<String>.from(topicData['difficultyLevels']),
              passMarksPercentage: topicData['passMarksPercentage'],
              logoPath: topicData['logoPath'],
            ),
          );
        },
      ),
    );
  }

  void navigateToQuizQuestion(BuildContext context, Map<String, dynamic> topicData) {
    List<Map<String, dynamic>> questions = quizQuestions.firstWhere(
      (topic) => topic['topic'] == topicData['topic'],
      orElse: () => {}
    )['questions'];

    if (questions != null && questions.isNotEmpty) {
      if (_currentQuestionIndex < questions.length) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizQuestionWidget(
              question: questions[_currentQuestionIndex]['question'],
              options: List<String>.from(questions[_currentQuestionIndex]['options']),
              isLastQuestion: _currentQuestionIndex == questions.length - 1,
              topicData: topicData['topic'],
              currentQuestionIndex: _currentQuestionIndex, // Pass the current question index
              onNextQuestion: () {
                setState(() {
                  _currentQuestionIndex++;
                });
              },
              onOptionSelected: (index) {
                // Handle option selected logic here
              },
            ),
          ),
        );
      }
    }
  }
}

