import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class AppStatusNavigationBar {
  changeColor(Color color) async {


    await FlutterStatusbarcolor.setStatusBarColor(color);
    if (useWhiteForeground(color)) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    } else {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }

    await FlutterStatusbarcolor.setNavigationBarColor(color);
    if (useWhiteForeground(color)) {
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
    } else {
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
    }

  }
}
