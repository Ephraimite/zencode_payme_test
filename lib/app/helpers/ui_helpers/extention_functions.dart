import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension CapExtension on String {
  String toMoneyFormat([String? currency = '']) {
    return isEmpty
        ? "0".toMoneyFormat()
        : "${getCurrencySymbol(currency)} ${NumberFormat("#,##0.00", "en_US").format(double.parse(this))}";
  }




}

extension StringExtensions on String {
  String asteriskFirstFourLetters() {
    if (length <= 4) {
      return this;
    }
    return "****${substring(4)}"; // Corrected logic
  }
}

extension AssetImageExtensions on String {
  ImageProvider? getCardImage() {
    try {
      return AssetImage('assets/images/$this');
    } catch (e) {
      return null; // Or handle the error as you see fit
    }
  }

  ImageProvider? getCollectingFundsImage() {
    try {
      return AssetImage('assets/images/$this');
    } catch (e) {
      return null; // Or handle the error as you see fit
    }
  }

  ImageProvider? getOtherImage() {
    try {
      return AssetImage('assets/images/$this');
    } catch (e) {
      return null; // Or handle the error as you see fit
    }
  }
}

extension AssetName on String {
  String get svg => 'assets/svgs/$this.svg';
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get mp4 => 'assets/videos/$this.mp4';
  String get gif => 'assets/gifs/$this.gif';
}

String getCurrencySymbol(String? currency) {
  if (currency != null && currency.isNotEmpty) {
    if (currency.contains("USD")) return "\u{00024}";
    if (currency.contains("GBP")) return "\u{00A3}";
    if (currency.contains("EUR")) return "\u{20AC}";
    if (currency.contains("NGN")) return "\u{20A6}";
    if (currency.contains("GEL")) return "\u{20BE}";
  }
  return currency ?? "";
}


