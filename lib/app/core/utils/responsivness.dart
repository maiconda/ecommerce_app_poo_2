import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_scaled_box.dart';
import 'package:responsive_framework/responsive_value.dart';

class Responsiveness {
  static Widget returnResponsiveWidget({
    required Widget widget,
    required BuildContext context,
  }) {
    return ResponsiveScaledBox(
      width: ResponsiveValue<double>(
        context,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 400),
          Condition.equals(name: TABLET, value: 650),
        ],
      ).value,
      child: widget,
    );
  }
}
