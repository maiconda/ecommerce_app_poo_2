import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          title: Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.orangeAccent.withOpacity(0.5),
              child: Icon(
                FontAwesomeIcons.question,
                size: 50,
                color: Colors.orange,
              ),
            ),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: <Widget>[
            ActionButtonWidget(
              label: cancelLabel,
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

class ActionButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ActionButtonWidget(
      {required this.label,
      required this.onPressed,
      super.key,});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
