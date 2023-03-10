import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';
import 'package:quiz_app/features/authentication/presentation/register_screen.dart';
import 'package:quiz_app/features/authentication/presentation/widgets/custom_button.dart';
import 'package:quiz_app/features/authentication/presentation/widgets/login_or_register_text.dart';
import 'package:quiz_app/features/authentication/presentation/widgets/text_row.dart';

import '../../../core/shared/components/add_vertical_space.dart';
import '../../../core/shared/components/background_image.dart';
import '../../../core/shared/components/custom_form_field.dart';
import '../../../core/shared/components/password_form_field.dart';
import '../../../core/util/dialog_helper.dart';
import '../../../core/util/navigator_helper.dart';
import '../../../resources/app_margins_paddings.dart';
import '../../../resources/app_strings.dart';
import '../../home_screen/presentation/home_screen.dart';
import '../cubits/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is StartLoadingState) {
          DialogHelper.loadingDialog(context);
        }
        //
        else if (state is EndLoadingToHomeScreen) {
          Navigator.of(context).pop();
          NavigatorHelper.pushReplacement(
            context,
            const HomeScreen(),
          );
        }
        //
        else if (state is EndLoadingStateWithError) {
          Navigator.of(context).pop();
          DialogHelper.messageDialog(context, state.msg.tr(context));
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Stack(
            // fit: StackFit.expand,
            children: [
              const BackgroundImage(),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const LoginOrRegisterText(AppStrings.login),
                          const AddVerticalSpace(AppPadding.p20),
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p16),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  CustomFormFiled(
                                    context: context,
                                    textInputType: TextInputType.emailAddress,
                                    controller: _emailController,
                                    label: AppStrings.email,
                                    prefixWidget:
                                        const Icon(Icons.mail_outline),
                                    validate: (value) {
                                      return AuthCubit.getIns(context)
                                          .validateEmail(context, value);
                                    },
                                  ),
                                  const AddVerticalSpace(AppPadding.p20),
                                  PasswordFormFiled(
                                    context: context,
                                    controller: _passwordController,
                                    label: AppStrings.password,
                                    validate: (value) {
                                      return AuthCubit.getIns(context)
                                          .validatePassword(context, value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomButton(
                            text: AppStrings.login.tr(context),
                            isExtended: true,
                            onTap: () async {
                              await AuthCubit.getIns(context).login(
                                _emailController.text,
                                _passwordController.text,
                                _formKey,
                              );
                            },
                          ),
                          TextRow(
                            text: AppStrings.dontHaveAccount,
                            textButton: AppStrings.registerNow,
                            onTap: () {
                              NavigatorHelper.pushAndRemoveUntil(
                                context,
                                const RegisterScreen(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
