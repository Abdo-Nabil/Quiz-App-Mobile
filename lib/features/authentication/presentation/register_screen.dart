import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';
import 'package:quiz_app/features/authentication/presentation/login_screen.dart';
import 'package:quiz_app/features/authentication/presentation/widgets/custom_button.dart';
import 'package:quiz_app/features/authentication/presentation/widgets/login_or_register_text.dart';
import 'package:quiz_app/features/authentication/presentation/widgets/text_row.dart';
import 'package:quiz_app/features/authentication/services/models/user_model.dart';
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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  //
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is StartLoadingState) {
          DialogHelper.loadingDialog(context);
        }
        //
        else if (state is EndLoadingToHomeScreen) {
          Navigator.of(context).pop();
          NavigatorHelper.pushAndRemoveUntil(context, const HomeScreen());
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
                          const LoginOrRegisterText(AppStrings.register),
                          const AddVerticalSpace(AppPadding.p20),
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p16),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  CustomFormFiled(
                                    context: context,
                                    controller: _nameController,
                                    label: AppStrings.name,
                                    prefixWidget: const Icon(Icons.person),
                                    validate: (value) {
                                      return AuthCubit.getIns(context)
                                          .validateName(context, value);
                                    },
                                  ),
                                  const AddVerticalSpace(AppPadding.p20),
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
                                  const AddVerticalSpace(AppPadding.p20),
                                  PasswordFormFiled(
                                    context: context,
                                    controller: _rePasswordController,
                                    label: AppStrings.reenterPassword,
                                    validate: (value) {
                                      return AuthCubit.getIns(context)
                                          .validateSecondPassword(context,
                                              value, _passwordController.text);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomButton(
                            text: AppStrings.register.tr(context),
                            onTap: () async {
                              await AuthCubit.getIns(context).createNewUser(
                                UserModel(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text.trim(),
                                ),
                                _formKey,
                              );
                            },
                          ),
                          TextRow(
                            text: AppStrings.alreadyHaveAccount,
                            textButton: AppStrings.loginNow,
                            onTap: () {
                              NavigatorHelper.pushAndRemoveUntil(
                                context,
                                const LoginScreen(),
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
      // child: GestureDetector(
      //   onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      //   child: Scaffold(
      //     body: IntroductionScreen(
      //       key: introKey,
      //       globalBackgroundColor: ColorsManager.greyBlack,
      //       dotsDecorator: DotsDecorator(
      //         activeColor: Theme.of(context).colorScheme.primary,
      //         color: Theme.of(context).primaryColorLight,
      //         activeSize: const Size.square(12.5),
      //       ),
      //       next: TextButton(
      //         child: Text(
      //           AppStrings.next.tr(context),
      //         ),
      //         onPressed: () {
      //           _onNext();
      //         },
      //       ),
      //       showBackButton: true,
      //       back: TextButton(
      //         child: Text(
      //           AppStrings.back.tr(context),
      //         ),
      //         onPressed: () {
      //           _onBack();
      //         },
      //       ),
      //       done: TextButton(
      //         child: Text(
      //           AppStrings.done.tr(context),
      //         ),
      //         onPressed: () async {
      //           await _onDone();
      //         },
      //       ),
      //       onDone: () {},
      //       pages: [
      //         PageViewModel(
      //           title: '',
      //           bodyWidget: SecurityForm(
      //             securityFormKey: securityFormKey,
      //             emailController: emailController,
      //             passwordController: passwordController,
      //             rePasswordController: rePasswordController,
      //           ),
      //         ),
      //         PageViewModel(
      //           title: '',
      //           bodyWidget: PersonalForm(
      //             personalFormKey: personalFormKey,
      //             nameController: nameController,
      //             phoneController: phoneController,
      //             ageController: ageController,
      //             genderController: genderController,
      //           ),
      //         ),
      //         PageViewModel(
      //           title: '',
      //           bodyWidget: CarForm(
      //             carFormKey: carFormKey,
      //             carModelController: carModelController,
      //             plateNumberController: plateNumberController,
      //             carColorController: carColorController,
      //             productionDateController: productionDateController,
      //             numOfPassengersController: numOfPassengersController,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  //
  // _onDone() async {
  //   if (securityFormKey.currentState!.validate() &&
  //       personalFormKey.currentState!.validate() &&
  //       carFormKey.currentState!.validate()) {
  //     await AuthCubit.getIns(context).createNewUser(
  //       CaptainModel(
  //         email: emailController.text,
  //         password: passwordController.text,
  //         name: nameController.text,
  //         phone: '+20${phoneController.text}',
  //         age: ageController.text,
  //         gender: genderController.text,
  //         carModel: carModelController.text,
  //         plateNumber: plateNumberController.text,
  //         carColor: carColorController.text,
  //         productionDate: productionDateController.text,
  //         numOfPassengers: numOfPassengersController.text,
  //       ),
  //     );
  //   } else {
  //     DialogHelper.messageDialog(context, AppStrings.emptyValue.tr(context));
  //   }
  // }
}

// body: SingleChildScrollView(
//   child: Column(
//     children: [
//       // const ImageWithLogo(),
//       const AddVerticalSpace(AppPadding.p100),
//       const LoginOrRegisterText(AppStrings.registerANewCaptain),
//       const AddVerticalSpace(AppPadding.p20),
//       Padding(
//         padding: const EdgeInsets.all(AppPadding.p16),
//         child: Form(
//           key: _formKey1,
//           child: Column(
//             children: [
//               CustomFormFiled(
//                 context: context,
//                 controller: _nameController,
//                 label: AppStrings.username,
//                 prefixWidget: const Icon(
//                   Icons.person,
//                 ),
//                 validate: (value) {
//                   // return AuthCubit.getIns(context)
//                   //     .validateUsername(context, value);
//                   return 'enter your name';
//                 },
//               ),
//               const AddVerticalSpace(AppPadding.p16),
//               ],
//           ),
//         ),
//       ),
//       BlocBuilder<AuthCubit, AuthState>(
//         builder: (context, state) {
//           return CustomButton(
//             text: AppStrings.register.tr(context),
//             onTap: () async {
//               // await AuthCubit.getIns(context).register(
//               //   _formKey,
//               //   _nameController,
//               // );
//               _formKey.currentState?.widget;
//             },
//           );
//         },
//       ),
//       TextRow(
//         text: AppStrings.alreadyHaveAccount,
//         textButton: AppStrings.loginNow,
//         onTap: () {
//           NavigatorHelper.pushAndRemoveUntil(
//             context,
//             const LSizedBoxn(),
//           );
//         },
//       ),
//     ],
//   ),
// ),
// body: IntroductionScreen(
//   globalBackgroundColor: ColorsManager.greyBlack,
//   dotsDecorator: DotsDecorator(
//     activeColor: Theme.of(context).colorScheme.primary,
//     color: Theme.of(context).primaryColorLight,
//     activeSize: const Size.square(15),
//   ),
//   next: CustomButton(onTap: () {}, text: 'zzz'),
//   key: introKey,
//   pages: [
//     PageViewModel(
//       title: "Title of first page",
//       bodyWidget: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const [
//           Text(" to edit a post"),
//           Text(" to edit a post"),
//           Text(" to edit a post"),
//           Text(" to edit a post"),
//           Text(" to edit a post"),
//           Text(" to edit a post"),
//           Text(" to edit a post"),
//           Text(" to edit a post"),
//           Text(" to edit a post"),
//         ],
//       ),
//     ),
//     PageViewModel(
//       title: "Title of first page",
//       bodyWidget: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const [
//           Text("Click on "),
//           Icon(Icons.edit),
//           Text(" to edit a post"),
//         ],
//       ),
//       image: const Center(child: Icon(Icons.android)),
//     ),
//   ],
//   done: const Text("Done",
//       style: TextStyle(fontWeight: FontWeight.w600)),
//   onDone: () {
//     // When done button is press
//   },
//   onChange: (index) {
//     setState(() {
//       pageIndex = index;
//     });
//   },
// ),
