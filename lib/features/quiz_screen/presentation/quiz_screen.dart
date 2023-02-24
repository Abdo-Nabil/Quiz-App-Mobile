import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/widgets/add_horizontal_space.dart';
import 'package:quiz_app/core/widgets/add_vertical_space.dart';
import 'package:quiz_app/features/home_screen/services/models/quiz_model.dart';
import 'package:quiz_app/features/shared/components/background_image.dart';
import 'package:quiz_app/features/shared/surrounded_container.dart';
import 'package:quiz_app/resources/app_margins_paddings.dart';

import '../components/timer_widget.dart';

class QuizScreen extends StatelessWidget {
  final QuizModel quizModel;
  const QuizScreen({
    required this.quizModel,
    Key? key,
  }) : super(key: key);

  static const String routeName = 'quiz_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        quizModel.quizName.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                    ),
                    const AddHorizontalSpace(AppPadding.p8),
                    TimerWidget(durationInMin: quizModel.quizDuration),
                    const AddHorizontalSpace(AppPadding.p32),
                  ],
                ),
                const AddVerticalSpace(AppPadding.p16),
                SurroundedContainer(
                    height: context.height * 0.85,
                    width: double.infinity,
                    child: Column(
                      children: [
                        const AddVerticalSpace(AppPadding.p16),
                        SurroundedContainer(
                          height: context.height * 0.10,
                          width: context.width * 0.83,
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p12),
                            child: SingleChildScrollView(
                              child: Text(
                                'hh',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.fontSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const AddVerticalSpace(AppPadding.p48),
                        SurroundedContainer(
                          height: context.height * 0.07,
                          width: context.width * 0.83,
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p12),
                            child: SingleChildScrollView(
                              child: Text(
                                '1) yes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.fontSize,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
