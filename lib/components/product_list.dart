import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:product_manager/components/product_listview.dart';
import 'package:product_manager/utils/helper_classes/database_helper.dart';
import 'package:product_manager/widgets/progress_indicator.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: DatabaseHelper.getProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong!"));
        } else if (snapshot.hasData || snapshot.data != null) {
          return ProductsListView(documents: snapshot.data!.docs);
        }
        return const CustomProgressIndicator();
      },
    );
  }
}
