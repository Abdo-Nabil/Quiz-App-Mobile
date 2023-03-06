import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/features/home_screen/services/models/quiz_model.dart';

import '../../../../core/shared/components/add_vertical_space.dart';
import '../../../../resources/app_margins_paddings.dart';
import '../../../../core/shared/keep_alive_page.dart';
import '../../cubits/quiz_screen_cubit.dart';
import 'option_container.dart';
import '../../../../resources/colors_manager.dart';

class QuizBody extends StatefulWidget {
  const QuizBody({Key? key}) : super(key: key);

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  final PageController pageController = PageController();
  //
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    final QuizScreenCubit quizScreenCubit = QuizScreenCubit.getInst(context);
    final QuizModel quizModel = quizScreenCubit.quizModel!;
    quizScreenCubit.quizPageViewController = pageController;
    quizScreenCubit.initiateLists();
    //
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (index) {
          quizScreenCubit.onPageChanged(index);
        },
        itemCount: quizModel.questions.length,
        itemBuilder: (context, index1) {
          //
          //
          return KeepAlivePage(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Container(
                height: context.height * 0.78,
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: ColorsManager.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppPadding.p16),
                  ),
                ),
                child: Column(
                  children: [
                    const AddVerticalSpace(AppPadding.p16),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p12),
                      child: SingleChildScrollView(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                quizModel.questions[index1].question,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.fontSize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: quizModel.questions[index1].options.length,
                        itemBuilder: (context, index2) {
                          return BlocBuilder<QuizScreenCubit, QuizScreenState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  const AddVerticalSpace(AppPadding.p12),
                                  InkWell(
                                    child: OptionContainer(
                                      isSelected: quizScreenCubit
                                          .optionsList[index1][index2],
                                      optionText: quizModel
                                          .questions[index1].options[index2],
                                    ),
                                    onTap: () {
                                      quizScreenCubit.onOptionSelect(
                                          index1, index2);
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
