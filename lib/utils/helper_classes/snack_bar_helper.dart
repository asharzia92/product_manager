import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showSnackBar({required BuildContext context, required String text, required IconData icon}) {
    final SnackBar snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 100, right: 20, left: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 8),
          Flexible(
              child: Text(
            text,
            style: const TextStyle(color: Colors.green),
          ))
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
