import 'package:flutter/material.dart';

//This class is responsible for allowing me to use the snackbar without context
class GlobalScaffold {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static final GlobalScaffold instance = GlobalScaffold();

  void showSnackbar(SnackBar snackBar) {
    instance.scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
  }
}
