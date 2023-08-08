import 'package:flutter/material.dart';

class QuizQuestionWidget extends StatefulWidget {
  final String question;
  final List<String> options;
  final Function(int) onOptionSelected;
  final bool isLastQuestion;
  final String topicData;
  final Function() onNextQuestion; // Add this callback function
  final int currentQuestionIndex; // Add this property

  QuizQuestionWidget({
    required this.question,
    required this.options,
    required this.onOptionSelected,
    required this.isLastQuestion,
    required this.topicData,
    required this.onNextQuestion, // Pass the callback function to the constructor
    required this.currentQuestionIndex, // Pass the current question index to the constructor
  });

  @override
  _QuizQuestionWidgetState createState() => _QuizQuestionWidgetState();
}

class _QuizQuestionWidgetState extends State<QuizQuestionWidget> {
  int? selectedOptionIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(4),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "${widget.topicData} Question",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                widget.question,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: selectedOptionIndex == index
                          ? Colors.blue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue),
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
                    widget.onOptionSelected(selectedOptionIndex!);
                    if (!widget.isLastQuestion) {
                      // Trigger the onNextQuestion callback to navigate to the next question
                      widget.onNextQuestion();
                      selectedOptionIndex = null; // Reset selected option for the next question
                    } else {
                      // Handle quiz finished logic
                      print("Quiz Finished!");
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  primary: Colors.blue,
                ),
                child: Text(
                  widget.isLastQuestion ? "Finish" : "Next",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
