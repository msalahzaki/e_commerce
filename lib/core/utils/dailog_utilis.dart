import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';


class DailogUtilis {
  static void showLoading({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: AppStyles.medium20Black,
                  ),
                )
              ],
            ),
          );
        });
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    String title = '',
    String? postActionname,
    Function? postActionFunc,
    required BuildContext context,
    required String message,
  }) {
    List<Widget> actions = [];
    if (postActionname != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            postActionFunc?.call();
          },
          child: Text(
            postActionname,
            style: AppStyles.medium20Black,
          )));
    }

    showDialog(
        //barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              message,
              style: AppStyles.medium20Black,
            ),
            title: Text(
              title,
              style: AppStyles.medium20Orange,
            ),
            actions: actions,
          );
        });
  }
}
