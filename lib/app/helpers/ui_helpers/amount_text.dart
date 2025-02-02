import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zencode_payme_test/app/helpers/ui_helpers/extention_functions.dart';

Widget currencyText(
    {required double? amount,
    String? precedingText = "",
    String? trailingText = "",
    TextStyle style = const TextStyle(
        color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
    String? currency = "NGN"}) {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
      text: '$precedingText ${formatAmount(amount, currency)}$trailingText',
      style: style,
    ),
  );
}

String formatAmount(double? amount, [String? currency = '']) {
  var formatter = NumberFormat("#,##0.00", "en_US");
  return "${getCurrencySymbol(currency)} ${formatter.format(amount)}";
}
