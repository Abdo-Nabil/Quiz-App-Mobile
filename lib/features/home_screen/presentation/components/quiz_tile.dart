import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';
import 'package:quiz_app/core/util/dialog_helper.dart';
import 'package:quiz_app/core/util/navigator_helper.dart';
import 'package:quiz_app/core/widgets/add_horizontal_space.dart';

import '../../../../resources/app_margins_paddings.dart';
import '../../../../resources/app_strings.dart';
import '../../../quiz_screen/presentation/quiz_screen.dart';
import '../../services/models/quiz_model.dart';

class QuizTile extends StatelessWidget {
  final QuizModel quizModel;
  final bool isDone;
  const QuizTile({
    required this.quizModel,
    required this.isDone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DialogHelper.messageWithActionsDialog(
          context,
          AppStrings.startQuizNow.tr(context),
          () {
            NavigatorHelper.push(
              context,
              QuizScreen(
                quizModel: quizModel,
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Container(
          width: double.infinity,
          height: 75,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppPadding.p16),
            ),
            color: Colors.grey.withAlpha(80),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quizModel.quizName,
                        style: TextStyle(
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                          fontSize:
                              Theme.of(context).textTheme.titleMedium?.fontSize,
                        ),
                      ),
                      const SizedBox(
                        height: AppPadding.p6,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.watch_later),
                          const AddHorizontalSpace(AppPadding.p6),
                          Text(
                            '${quizModel.quizDuration} min',
                            style: TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.fontSize,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: AppPadding.p10,
                ),
                //ToDo:
                isDone ? const Icon(Icons.check_sharp) : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
