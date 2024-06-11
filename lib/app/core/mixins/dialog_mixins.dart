import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../error/failures.dart';

mixin DialogMixins {

  Future<void> showMessageDialog({
    required BuildContext context,
    required String message,
    Key? key,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          key: key,
          title: const Center(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/new_maplog150.jpg'),
            ),
          ),
          content: Text(
            message,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          actionsAlignment: MainAxisAlignment.end,
          actions: <Widget>[
            ActionButtonWidget(
              label: 'Confirm', // Replace with _appLocalizations.confirm if available
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  Future<void> showSuccessDialog({
    required BuildContext context,
    required String message,
    Function()? onPressed,
    bool dismissible = true,
    Key? key,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return SuccessfulWidget(
          key: key,
          message: message,
          onPressed: onPressed,
        );
      },
    );
  }

  Future<void> showFailureDialog({
    required BuildContext context,
    required String message,
    Function()? onPressed,
    bool dismissible = true,
    Key? key,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return FailureWidget(
          key: key,
          message: message,
          onPressed: onPressed,
        );
      },
    );
  }
}

// Define ActionButtonWidget and SuccessfulWidget based on your application's requirements
class ActionButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ActionButtonWidget({required this.label, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

class SuccessfulWidget extends StatelessWidget {
  final String message;
  final Function()? onPressed;

  const SuccessfulWidget({required this.message, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      title: const Center(
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.greenAccent,
          child: Icon(
            FontAwesomeIcons.check,
            size: 50,
            color: Colors.green,
          ),
        ),
      ),
      content: Text(
        message,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: <Widget>[
        ActionButtonWidget(
          label: 'Confirm', // Replace with _appLocalizations.confirm if available
          onPressed: () {
            Navigator.pop(context);
            if (onPressed != null) onPressed!();
          },
        ),
      ],
    );
  }
}

class FailureWidget extends StatelessWidget {
  final String message;
  final Function()? onPressed;

  const FailureWidget({required this.message, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      title: const Center(
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.redAccent,
          child: Icon(
            FontAwesomeIcons.cross,
            size: 50,
            color: Colors.red,
          ),
        ),
      ),
      content: Text(
        message,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: <Widget>[
        ActionButtonWidget(
          label: 'Confirm', // Replace with _appLocalizations.confirm if available
          onPressed: () {
            Navigator.pop(context);
            if (onPressed != null) onPressed!();
          },
        ),
      ],
    );
  }
}