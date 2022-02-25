import 'package:flutter/material.dart';
import 'package:product_manager/utils/colors.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Job Assignment',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(primarySwatch: MaterialColor(0xFFFD7272, themeColor)),
      home: const ProductListScreen(),
    );
  }
}
