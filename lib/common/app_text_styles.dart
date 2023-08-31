import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  // heading
  static h1(Color color) {
    return TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static h2(Color color) {
    return TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  // main text
  static b1(Color color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static b1Medium(Color color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static b2(Color color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static b2Medium(Color color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static b3(Color color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static b3Medium(Color color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
}
