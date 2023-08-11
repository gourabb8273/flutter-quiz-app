import 'package:flutter/material.dart';
import './quiz_question.dart';

class QuizTopicWidget extends StatelessWidget {
  final String topic;
  final int numberOfQuestions;
  final List<String> difficultyLevels;
  final int passMarksPercentage;
  final String logoPath; // Add logoPath property

  QuizTopicWidget({
    required this.topic,
    required this.numberOfQuestions,
    required this.difficultyLevels,
    required this.passMarksPercentage,
    required this.logoPath, // Add logoPath to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => navigateToQuizQuestion(context), // Add this line
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        child: Container(
          width: 250,
          margin: EdgeInsets.symmetric(vertical: 3),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo with Border Radius
              Padding(
                padding: EdgeInsets.all(5.0), // Add padding here
                child: Container(
                  width: 70,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      logoPath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Topic and Difficulty Levels
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 30), // Adjust the margin value as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        topic,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 8),
              // Number of Questions and Pass Marks Percentage
              Padding(
                padding: EdgeInsets.only(
                    top: 8.0), // Add the desired top margin here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Pass Marks: ${passMarksPercentage.toStringAsFixed(1)}%',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Questions: $numberOfQuestions',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 6),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: difficultyLevels.map((level) {
                        return Chip(
                          label: Text(
                            level,
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 46, 146, 49),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
