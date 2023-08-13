import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/signup_page.dart';
import 'pages/login_page.dart';
import './store/quiz.dart';
import './store/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuizStore()),
        ChangeNotifierProvider(create: (context) => UserStore()),
      ],
      child: QuizApp(),
    ),
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: LoginPage());
  }
}
