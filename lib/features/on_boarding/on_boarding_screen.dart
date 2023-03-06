import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';
import 'package:quiz_app/core/util/navigator_helper.dart';
import 'package:quiz_app/features/authentication/presentation/login_screen.dart';
import '../../resources/app_margins_paddings.dart';
import '../../resources/app_strings.dart';
import '../general/cubits/general_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static String routeName = 'on_boarding_screen';

  @override
  Widget build(BuildContext context) {
    //
    PageDecoration pageDecoration = PageDecoration(
      imagePadding: EdgeInsets.only(
        top: context.height * 0.05,
        right: AppPadding.p8,
        left: AppPadding.p8,
      ),
      contentMargin: EdgeInsets.only(top: context.height * 0.15),
    );
    //
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: IntroductionScreen(
          isBottomSafeArea: true,
          isTopSafeArea: true,
          showDoneButton: true,
          done: Text(
            AppStrings.done.tr(context),
          ),
          onDone: () {
            BlocProvider.of<GeneralCubit>(context)
                .setInitialScreen(OnBoardingScreen.routeName);
            NavigatorHelper.pushReplacement(
              context,
              const LoginScreen(),
            );
          },
          showSkipButton: false,
          // skip: Text(
          //   AppStrings.skip.tr(context),
          // ),
          // showNextButton: true,
          next: const Icon(Icons.arrow_forward),
          dotsDecorator: DotsDecorator(
            activeColor: Theme.of(context).colorScheme.primary,
          ),
          pages: List.generate(
            1,
            (index) {
              return PageViewModel(
                title: 'title${index + 1}'.tr(context),
                body: 'description${index + 1}'.tr(context),
                image: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/title${index + 1}.png',
                        fit: BoxFit.contain,
                        height: context.height * 0.8,
                        width: context.width * 0.8,
                      ),
                    ),
                    // AddVerticalSpace(context.h)
                  ],
                ),
                decoration: pageDecoration,
              );
            },
          ),
        ),
      ),
    );
  }
}
