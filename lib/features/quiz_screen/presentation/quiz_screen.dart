import 'package:flutter/material.dart';
import 'package:quiz_app/features/shared/components/background_image.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  static const String routeName = 'quiz_screen';
  @override
  Widget build(BuildContext context) {
    final quizModel = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Stack(
        children: const [
          BackgroundImage(),
        ],
      ),
    );
  }
}
