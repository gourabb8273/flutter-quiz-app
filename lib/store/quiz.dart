import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizStore with ChangeNotifier {
  int _currentQuestionIndex = 0;
  List<Map<String, dynamic>> quizTopics = [];
  int get currentQuestionIndex => _currentQuestionIndex;

  Future<void> fetchQuizTopics() async {
    try {
      QuerySnapshot topicSnapshot =
          await FirebaseFirestore.instance.collection('topics').get();
      quizTopics = topicSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      notifyListeners();
    } catch (error) {
      print("Error while fetching topics");
    }
  }

  Future<Map<String, dynamic>> getQuestionAndOptionsForTopic(
      String topic) async {
    //Fetch questions according to topic from Firebase Database
    QuerySnapshot questionsSnapshot = await FirebaseFirestore.instance
        .collection('questions')
        .where('topic', isEqualTo: topic)
        .get();
    List<Map<String, dynamic>> questionsData = questionsSnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    var questions = questionsData[0]['questions'];

    Map<String, dynamic>? currentTopic = quizTopics.firstWhere(
      (topicData) => topicData['topic'] == topic,
      orElse: () => {},
    );
    if (questions != null && questions.isNotEmpty) {
      if (_currentQuestionIndex < questions.length) {
        return {
          'question': questions[_currentQuestionIndex]['question'],
          'options':
              List<String>.from(questions[_currentQuestionIndex]['options']),
          'isLastQuestion': _currentQuestionIndex == questions.length - 1,
          'topicData': topic,
          'correctOptionIndex': questions[_currentQuestionIndex]
              ['correctOptionIndex'],
          'total': questions.length,
          'passMarksPercentage': currentTopic['passMarksPercentage'],
        };
      }
    }

    return {
      'question': '',
      'options': [],
      'isLastQuestion': false,
      'topicData': topic,
      'correctOptionIndex': 0,
      'total': '',
      'passMarksPercentage': '',
    };
  }

  Future<void> fetchQuizResult(String uid) async {
    try {
      //Get quiz result for unique user
      QuerySnapshot resultSnapshot = await FirebaseFirestore.instance
          .collection('result')
          .where('uid', isEqualTo: uid)
          .get();
      List<Map<String, dynamic>> result = resultSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (error) {
      print("Error fetching quiz result $error");
    }
  }

  void nextQuestion() {
    _currentQuestionIndex++;
    notifyListeners();
  }

  void onFinish() {
    _currentQuestionIndex = 0;
  }
}
