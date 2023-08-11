import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

List<Map<String, dynamic>> quizTopicsInfo = [
  {
    'topic': 'Node.js',
    'numberOfQuestions': 5,
    'difficultyLevels': ['Easy'],
    'passMarksPercentage': 65,
    'logoPath': 'assets/nodejs.png',
  },
  {
    'topic': 'React',
    'numberOfQuestions': 6,
    'difficultyLevels': ['Expert'],
    'passMarksPercentage': 95,
    'logoPath': 'assets/react.png',
  },
  {
    'topic': 'Flutter',
    'numberOfQuestions': 6,
    'difficultyLevels': ['Beginner'],
    'passMarksPercentage': 75,
    'logoPath': 'assets/flutter.png',
  },
  {
    'topic': 'AWS',
    'numberOfQuestions': 6,
    'difficultyLevels': ['Advanced'],
    'passMarksPercentage': 65,
    'logoPath': 'assets/aws.png',
  },
  {
    'topic': 'JavaScript',
    'numberOfQuestions': 6,
    'difficultyLevels': ['Easy'],
    'passMarksPercentage': 85,
    'logoPath': 'assets/javascript.png',
  },
    {
    'topic': 'MongoDB',
    'numberOfQuestions': 5,
    'difficultyLevels': ['Advanced'],
    'passMarksPercentage': 65,
    'logoPath': 'assets/mongodb.png',
  },
];

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
        'correctOptionIndex': 1,
      },
      {
        'question': 'NodeJS is written in which Language?',
        'options': ['C++', 'C', 'JavaScript', 'Java'],
        'correctOptionIndex': 3
      },
      {
        'question': 'Which of the following are examples of node modules?',
        'options': ['Express', 'Body Parser', 'Socket.io', 'All of the above'],
        'correctOptionIndex': 4
      },
      {
        'question': 'How can we expose node modules?',
        'options': ['exports', 'expose', 'require', 'None of the above'],
        'correctOptionIndex': 1
      },
      {
        'question': 'How many node objects methods are available?',
        'options': ['21', '20', '19', '18'],
        'correctOptionIndex': 4
      },     
    ],
  },
  {
    'topic': 'React',
    'questions': [
      {
        'question':
            'What of the following is used in React.js to increase performance?',
        'options': [
          'Original DOM',
          'Virtual DOM',
          'Both A and B.',
          'None of the above.'
        ],
        'correctOptionIndex': 2
      },
      {
        'question': 'What is a state in React?',
        'options': [
          'A permanent storage.',
          'Internal storage of the component.',
          'External storage of the component.',
          'None of the above.'
        ],
        'correctOptionIndex': 2
      },
      {
        'question': 'What are the two ways to handle data in React?',
        'options': [
          'State & Props',
          'Services & Components',
          'State & Services',
          'State & Component'
        ],
        'correctOptionIndex': 1
      },
      {
        'question':
            'Which of the following option is correct in the case of the Babel?',
        'options': [
          'Babel is a Compiler.',
          'Babel is a Transpilar.',
          'None of the above.',
          'Both A and B are correct.'
        ],
        'correctOptionIndex': 4
      },
      {
        'question':
            'Which of the following function is used to change the state of the React.js component?',
        'options': [
          'this.setState',
          'this.setChangeState',
          'this.State{}',
          'None of the above.'
        ],
        'correctOptionIndex': 1
      },
      {
        'question':
            'Which of the following method refers to the parent class in React.js?',
        'options': ['inherits()', 'self()', 'super()', 'this()'],
        'correctOptionIndex': 3
      },     
    ],
  },
  {
    'topic': 'AWS',
    'questions': [
      {
        'question':
            'Which of the following service provides resizable compute capacity in the cloud?',
        'options': [
          'Amazon EC2',
          'Amazon RDS',
          'Amazon S3',
          'Amazon Redshift',
        ],
        'correctOptionIndex': 1,
      },
      {
        'question': 'What does S3 stand for in Amazon S3?',
        'options': [
          'Simple Storage Service',
          'Structured Storage Service',
          'Server Storage Service',
          'Standard Storage Service',
        ],
        'correctOptionIndex': 1,
      },
      {
        'question':
            'Which AWS service is used for deploying applications and managing containers?',
        'options': [
          'Amazon S3',
          'Amazon ECS',
          'Amazon DynamoDB',
          'Amazon RDS',
        ],
        'correctOptionIndex': 2,
      },
      {
        'question':
            'What is the global content delivery network (CDN) service provided by AWS?',
        'options': [
          'Amazon S3',
          'Amazon EC2',
          'Amazon CloudFront',
          'Amazon Route 53',
        ],
        'correctOptionIndex': 3,
      },
      {
        'question':
            'Which service is used to launch and manage virtual private servers (instances) in the cloud?',
        'options': [
          'Amazon VPC',
          'Amazon EC2',
          'Amazon S3',
          'Amazon Lambda',
        ],
        'correctOptionIndex': 2,
      },
      {
        'question':
            'Which service provides a managed NoSQL database service in AWS?',
        'options': [
          'Amazon RDS',
          'Amazon DynamoDB',
          'Amazon S3',
          'Amazon Redshift',
        ],
        'correctOptionIndex': 2,
      },  
    ],
  }, 
  {
    'topic': 'JavaScript',
    'questions': [
      {
        'question': 'Which of the following is NOT a data type in JavaScript?',
        'options': [
          'Number',
          'Boolean',
          'String',
          'Character',
        ],
        'correctOptionIndex': 4,
      },
      {
        'question':
            'What is the keyword used to declare variables in JavaScript?',
        'options': [
          'declare',
          'variable',
          'var',
          'let',
        ],
        'correctOptionIndex': 3,
      },
      {
        'question':
            'Which operator is used to concatenate strings in JavaScript?',
        'options': [
          '+',
          '&',
          '|',
          '-',
        ],
        'correctOptionIndex': 1,
      },
      {
        'question': 'What does the "=== "operator do in JavaScript?',
        'options': [
          'Compares values and type',
          'Compares values only',
          'Compares type only',
          'Assigns a value',
        ],
        'correctOptionIndex': 1,
      },
      {
        'question':
            'Which built-in function is used to convert a string to an integer?',
        'options': [
          'parseInt()',
          'convertToInt()',
          'toInteger()',
          'stringToInteger()',
        ],
        'correctOptionIndex': 1,
      },
      {
        'question':
            'What is the correct syntax for a function declaration in JavaScript?',
        'options': [
          'func myFunction()',
          'function = myFunction()',
          'def myFunction()',
          'function myFunction()',
        ],
        'correctOptionIndex': 4,
      },
    ],
  },
  {
    'topic': 'Flutter',
    'questions': [
      {
        'question':
            'What is the primary programming language used for Flutter development?',
        'options': [
          'Java',
          'C#',
          'Dart',
          'Python',
        ],
        'correctOptionIndex': 3,
      },
      {
        'question':
            'Which widget is the basic building block of a Flutter app?',
        'options': [
          'Container',
          'Text',
          'Column',
          'Scaffold',
        ],
        'correctOptionIndex': 1,
      },
      {
        'question': 'What does the "setState" method do in Flutter?',
        'options': [
          'Updates the app\'s state and triggers a rebuild',
          'Sets the state to a fixed value',
          'Removes the current widget from the tree',
          'Resets the widget\'s properties',
        ],
        'correctOptionIndex': 1,
      },
      {
        'question': 'What is a "BuildContext" in Flutter?',
        'options': [
          'A function that builds the UI hierarchy',
          'An object that holds the current app state',
          'A widget that represents the entire app',
          'A parameter passed to the build method',
        ],
        'correctOptionIndex': 4,
      },
      {
        'question':
            'Which Flutter widget is used to create a scrollable list of widgets?',
        'options': [
          'ListView',
          'GridView',
          'Column',
          'Row',
        ],
        'correctOptionIndex': 1,
      },
      {
        'question':
            'What is the purpose of the "main.dart" file in a Flutter app?',
        'options': [
          'It defines the app\'s primary color scheme',
          'It contains the app\'s business logic',
          'It specifies the app\'s layout and UI components',
          'It is the entry point of the app',
        ],
        'correctOptionIndex': 4,
      },
    ],
  },
  {
  'topic': 'MongoDB',
  'questions': [
    {
      'question': 'What does MongoDB store data in?',
      'options': [
        'Tables',
        'Collections',
        'Rows',
        'Columns',
      ],
      'correctOptionIndex': 2,
    },
    {
      'question': 'Which of the following is a BSON data type in MongoDB?',
      'options': [
        'String',
        'Integer',
        'Decimal',
        'ObjectID',
      ],
      'correctOptionIndex': 4,
    },
 {
  'question': 'What is the operator used for equality match on a field in MongoDB?',
  'options': [
    '{ field: { eq: value } }',
    '{ field: { equal: value } }',
    '{ field: { equals: value } }',
    '{ field: value }',
  ],
  'correctOptionIndex': 1,
},
{
  'question': 'Which MongoDB aggregation pipeline stage is used to group documents?',
  'options': [
    'project',
    'group',
    'match',
    'sort',
  ],
  'correctOptionIndex': 2,
},
    {
      'question': 'Which command is used to drop a collection in MongoDB?',
      'options': [
        'db.dropCollection()',
        'db.removeCollection()',
        'db.deleteCollection()',
        'db.destroyCollection()',
      ],
      'correctOptionIndex': 1,
    },
  ],
}

];

List<Map<String, dynamic>> quizResponse = [
  {
    'topic': 'NodeJS',
    'percentage': '90',
    'date': '2023-08-10 09:12',
    'isPass': true
  },
  {
    'topic': 'Flutter',
    'percentage': '80',
    'date': '2023-08-11 10:25',
    'isPass': false
  },
];

class QuizStore with ChangeNotifier {
  int _currentQuestionIndex = 0;
  List<Map<String, dynamic>> quizTopics = quizTopicsInfo;
  int get currentQuestionIndex => _currentQuestionIndex;
  List<Map<String, dynamic>> userQuizResponse = quizResponse;

  Map<String, dynamic> getQuestionAndOptionsForTopic(String topic) {
    List<Map<String, dynamic>> questions = quizQuestions.firstWhere(
      (topicData) => topicData['topic'] == topic,
      orElse: () => {},
    )['questions'];

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

  void nextQuestion() {
    print("inside state");
    print(_currentQuestionIndex);
    _currentQuestionIndex++;
    notifyListeners(); // Notify listeners of the change
  }

  void onFinish() {
    _currentQuestionIndex = 0;
  }

  void addResponse(response) {
    print('addddinggg rresponsee');
    userQuizResponse.add(response);
  }
}
