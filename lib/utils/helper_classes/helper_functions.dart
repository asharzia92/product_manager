import 'package:flutter/material.dart';

class HelperFunctions {
  static Future<dynamic> navigateTo({required BuildContext context, required Widget nextScreen}) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen));
  }
}
