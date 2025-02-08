

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';





class CustomDailog {
  static List<Widget> actions = [];
  Function? firstButtonAction;

  static void showLoading(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Loading ..."),
              )
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(  context) {
    Navigator.pop(context);
  }

  static void showMessageDailog(  context,
      {String? title,
      String? message,
      String? firstButtonLabel,
      Function? firstButtonAction,
      String? secondButtonLabel,
      Function? secondButtonAction}) {
    actions = [];

    if (firstButtonLabel != null) {
      actions.add(TextButton(
          onPressed: () {
            if (firstButtonAction != null) {
              firstButtonAction.call();
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(firstButtonLabel)));
    }
    if (secondButtonLabel != null) {
      actions.add(TextButton(
          onPressed: () {
            if (secondButtonAction != null) {
              secondButtonAction.call();
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            secondButtonLabel,
          )));
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: Text(
            message ?? "",
          ),
          actions: actions,
        );
      },
    );
  }

  static void showAwesomeErrorMessageDialog(
      {required  context, required String massage,Function()? okFunction }){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      headerAnimationLoop: false,
      title: 'Error',
      desc:massage,
      descTextStyle: AppStyles.normal20black,
      btnOkOnPress:okFunction,
      btnOkColor: Colors.red,
    ).show();
  }

  static void showAwesomeSuccessMessageDialog(
      {required  context, required String massage,Function()? okFunction , String? okText}){
    AwesomeDialog(
      context: context,
      animType: AnimType.leftSlide,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      title: 'Success',
      desc:massage,
      descTextStyle: AppStyles.normal20black,
      btnOkText: okText,
      btnOkOnPress:okFunction,
      btnOkIcon: Icons.check_circle,

    ).show();
  }
  }


