import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

List<Map<String, dynamic>> quizQuestions = [
  {
    'topic': 'Node.js',
    'questions': [
      {
        'question': 'What is the full form of REPL?',
        'options': [
          'Read Eval Print Loop',
          'Research Eval Program Learn',
          'Read Earn Point Learn',
          'Read Eval Point Loop'
        ],
        'correctOption': 'Read Eval Print Loop',
      },
      {
        'question': 'NodeJS is written in which Language?',
        'options': ['C++', 'C', 'JavaScript', 'Java'],
        'correctOption': 'JavaScript'
      },
      {
        'question': 'Which of the following are examples of node modules?',
        'options': ['Express', 'Body Parser', 'Socket.io', 'All of the above'],
        'correctOption': 'All of the above'
      },
      {
        'question': 'How can we expose node modules?',
        'options': ['exports', 'expose', 'require', 'None of the above'],
        'correctOption': 'exports'
      },
      {
        'question': 'How many node objects methods are available?',
        'options': ['21', '20', '19', '18'],
        'correctOption': '18'
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

class QuizStore with ChangeNotifier {
  int _currentQuestionIndex = 0;

  Map<String, dynamic> getQuestionAndOptionsForTopic(String topic) {
    List<Map<String, dynamic>> questions = quizQuestions.firstWhere(
      (topicData) => topicData['topic'] == topic,
      orElse: () => {},
    )['questions'];

    if (questions != null && questions.isNotEmpty) {
      if (_currentQuestionIndex < questions.length) {
        return {
          'question': questions[_currentQuestionIndex]['question'],
          'options':
              List<String>.from(questions[_currentQuestionIndex]['options']),
          'isLastQuestion': _currentQuestionIndex == questions.length - 1,
          'topicData': topic,
          'correctOption': questions[_currentQuestionIndex]['correctOption'],
          'total': questions.length,
        };
      }
    }

    return {
      'question': '',
      'options': [],
      'isLastQuestion': false,
      'topicData': topic,
      'correctOption': '',
      'total': '',
    };
  }

  int get currentQuestionIndex => _currentQuestionIndex;

  void nextQuestion() {
    print("inside state");
    print(_currentQuestionIndex);
    _currentQuestionIndex++;
    notifyListeners(); // Notify listeners of the change
  }

  void onFinish() {
    _currentQuestionIndex = 0;
  }
}
