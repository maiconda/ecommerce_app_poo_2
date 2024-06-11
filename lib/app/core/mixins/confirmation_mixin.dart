import 'package:flutter/material.dart';

mixin ConfirmationMixin {
  Future<void> showConfirmOperationDialog({
    required BuildContext context,
    required String message,
    required Function() confirmFunction,
    required String cancelLabel,
    required String confirmLabel,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            message,
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: <Widget>[
            ActionButtonWidget(
              label: cancelLabel,
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
            ),
            ActionButtonWidget(
              label: confirmLabel,
              onPressed: () {
                Navigator.of(context).pop();
                confirmFunction();
              },
            ),
          ],
        );
      },
    );
  }
}

// Presuming ActionButtonWidget is defined like this:
class ActionButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;

  const ActionButtonWidget({
    required this.label,
    required this.onPressed,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
