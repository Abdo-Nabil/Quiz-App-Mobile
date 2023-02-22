import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/features/home_screen/presentation/components/quiz_tile.dart';

import '../../../../resources/app_margins_paddings.dart';

class Body extends StatelessWidget {
  final List quizzes;
  const Body({required this.quizzes, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Container(
        width: double.infinity,
        height: context.height * 0.750,
        decoration: ShapeDecoration(
          // color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppPadding.p16),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: ListView.builder(
          itemCount: quizzes.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: AppPadding.p16,
                ),
                QuizTile(
                  quizModel: quizzes[index],
                  isDone: true,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
