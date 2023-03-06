import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';
import '../../features/general/services/general_repo.dart';
import '../../resources/app_strings.dart';

class DialogHelper {
  static Future loadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const LoadingDialog();
      },
    );
  }

  static Future messageDialog(BuildContext context, String msg,
      [Function? onOk]) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(AppStrings.alert.tr(context)),
          content: Text(msg),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onOk ?? () {};
                },
                child: Text(AppStrings.ok.tr(context)))
          ],
        );
      },
    );
  }

  static Future messageWithActionDialog(
      BuildContext context, String msg, Function onOkButton,
      {String? title}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? AppStrings.alert.tr(context)),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await onOkButton();
              },
              child: Text(
                AppStrings.ok.tr(context),
              ),
            )
          ],
        );
      },
    );
  }

  static Future updateDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(AppStrings.alert.tr(context)),
            content: Text(AppStrings.updateApp.tr(context)),
            actions: [
              TextButton(
                onPressed: () async {
                  // Navigator.of(context).pop();
                  await GeneralRepo.launchLink(
                      AppStrings.appUrlOnStore, context);
                },
                child: Text(
                  AppStrings.update.tr(context),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static Future blockedDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(AppStrings.alert.tr(context)),
            content: Text(AppStrings.youAreBlocked.tr(context)),
            actions: [
              TextButton(
                onPressed: () async {
                  // Navigator.of(context).pop();
                  await GeneralRepo.launchLink(
                      AppStrings.emailContact, context);
                },
                child: Text(
                  AppStrings.contact.tr(context),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static Future messageDialogWithRetry(
      BuildContext context, String msg, Function onRetry) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return RetryDialog(msg: msg, onRetry: onRetry);
      },
    );
  }

  static Future messageWithActionsDialog(
      BuildContext context, String msg, Function onOkButton,
      {String? title}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? AppStrings.areYouSure.tr(context)),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: Text(
                AppStrings.cancel.tr(context),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await onOkButton();
              },
              child: Text(
                AppStrings.ok.tr(context),
              ),
            ),
          ],
        );
      },
    );
  }

  //for only String searches
  static Future selectWithSearchDialog(
    BuildContext context, {
    required String title,
    required String searchHint,
    required List list,
    required TextEditingController controller,
  }) {
    List searchList = list;
    return showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Container(
            width: context.width * 0.95,
            constraints: BoxConstraints(
              maxHeight: context.height * 0.4,
            ),
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        label: Text(searchHint),
                      ),
                      onChanged: (value) {
                        setState(
                          () {
                            searchList = list
                                .where((element) =>
                                    element.toString().toLowerCase().contains(
                                          value.toString().toLowerCase(),
                                        ))
                                .toList();
                          },
                        );
                      },
                    ),
                    searchList.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text(AppStrings.notFound.tr(context)),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: searchList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text('${searchList[index]}'),
                                  onTap: () {
                                    controller.text =
                                        searchList[index].toString();
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  static Future selectDialog(
    BuildContext context, {
    required String title,
    required List list,
    required TextEditingController controller,
    required double height,
    List<Widget>? leadingListWidgets,
  }) {
    return showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Container(
            width: context.width * 0.95,
            constraints: BoxConstraints(
              maxHeight: height,
            ),
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('${list[index]}'),
                            leading: leadingListWidgets != null
                                ? leadingListWidgets[index]
                                : null,
                            onTap: () {
                              controller.text = list[index].toString();
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class RetryDialog extends StatelessWidget {
  final String msg;
  final Function onRetry;
  const RetryDialog({
    required this.msg,
    required this.onRetry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppStrings.alert.tr(context)),
      content: Text(msg),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await onRetry();
          },
          child: Text(
            AppStrings.retry.tr(context),
          ),
        )
      ],
    );
  }
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(AppStrings.loading.tr(context)),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
