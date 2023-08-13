import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/quiz.dart';
import './quiz_tab.dart';
import 'package:intl/intl.dart';

class QuizQuestionWidget extends StatefulWidget {
  final String topic;

  QuizQuestionWidget({required this.topic});

  @override
  _QuizQuestionWidgetState createState() => _QuizQuestionWidgetState();
}

class _QuizQuestionWidgetState extends State<QuizQuestionWidget> {
  int? selectedOptionIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizStore>(
      builder: (context, quizStore, _) {
        return FutureBuilder<Map<String, dynamic>>(
          future: quizStore.getQuestionAndOptionsForTopic(widget.topic),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Handle loading state if needed
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Handle error state if needed
              return Text('Error loading question');
            } else if (!snapshot.hasData) {
              // Handle no data state if needed
              return Text('No question data');
            }

            Map<String, dynamic> questionData = snapshot.data!;
            String question = questionData['question'];
            List<String> options = questionData['options'];
            bool isLastQuestion = questionData['isLastQuestion'];
            int total = questionData['total'];
            int correctOptionIndex = questionData['correctOptionIndex'];
            int passMarksPercentage = questionData['passMarksPercentage'];

            return _QuizQuestionContent(
              topic: widget.topic,
              question: question,
              options: options,
              total: total,
              correctOptionIndex: correctOptionIndex,
              isLastQuestion: isLastQuestion,
              passMarksPercentage: passMarksPercentage,
            );
          },
        );
      },
    );
  }
}

class _QuizQuestionContent extends StatefulWidget {
  final String topic;
  final String question;
  final int total;
  final List<String> options;
  final bool isLastQuestion;
  final int correctOptionIndex;
  final int passMarksPercentage;

  _QuizQuestionContent({
    required this.topic,
    required this.question,
    required this.options,
    required this.isLastQuestion,
    required this.total,
    required this.correctOptionIndex,
    required this.passMarksPercentage,
  });

  @override
  _QuizQuestionContentState createState() => _QuizQuestionContentState();
}

class _QuizQuestionContentState extends State<_QuizQuestionContent> {
  int? selectedOptionIndex;
  int totalMarks = 0;

  @override
  Widget build(BuildContext context) {
    QuizStore quizStore = Provider.of<QuizStore>(context);
    return Center(
      child: Card(
        margin: EdgeInsets.all(4),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(8.0), 
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 78, 70, 57),
                  borderRadius:
                      BorderRadius.circular(8.0), 
                ),
                child: Text(
                  "Quiz on ${widget.topic}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 254, 250),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Total Question - ${widget.total}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                "${quizStore.currentQuestionIndex + 1}. ${widget.question}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ...widget.options.asMap().entries.map((entry) {
                int index = entry.key;
                String option = entry.value;
                return GestureDetector(
                  onTap: () => setState(() {
                    selectedOptionIndex = index;
                  }),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 20),
                    decoration: BoxDecoration(
                      color: selectedOptionIndex == index
                          ? Color.fromARGB(255, 78, 70, 57)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Color.fromARGB(255, 78, 70, 57)),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 16,
                        color: selectedOptionIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (selectedOptionIndex != null) {                
                    if (selectedOptionIndex == widget.correctOptionIndex - 1) {
                      totalMarks += 1;
                    }
                    if (!widget.isLastQuestion) {
                      quizStore.nextQuestion();
                      selectedOptionIndex = null;
                    } else {
                      String currentDate =
                          DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
                      quizStore.onFinish();                   
                      quizStore.addResponse({
                        'topic': widget.topic,
                        'percentage': (totalMarks / widget.total * 100)
                            .toStringAsFixed(2),
                        'date': currentDate,
                        'isPass': widget.passMarksPercentage <=
                            (totalMarks / widget.total * 100),
                      });
                      Navigator.pop(context);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  primary: Colors.orange,
                ),
                child: Text(
                  widget.isLastQuestion ? "Finish" : "Next",
                  style: TextStyle(
                      fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
