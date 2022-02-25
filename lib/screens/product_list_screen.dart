import 'package:flutter/material.dart';
import 'package:product_manager/components/custom_appbar.dart';
import 'package:product_manager/components/product_list.dart';
import 'package:product_manager/screens/add_product_screen.dart';
import 'package:product_manager/utils/helper_classes/firebase_helper.dart';
import 'package:product_manager/utils/helper_classes/helper_functions.dart';
import 'package:product_manager/widgets/progress_indicator.dart';
import 'package:product_manager/widgets/rounded_button.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Manage Products"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Stack(
          children: [
            FutureBuilder(
              future: FirebaseHelper.initializeFirebase(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong!"));
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return const ProductList();
                }
                return const CustomProgressIndicator();
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: RoundedButton(
                  label: "Add Product",
                  onPressed: () => HelperFunctions.navigateTo(context: context, nextScreen: const AddProductScreen()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
