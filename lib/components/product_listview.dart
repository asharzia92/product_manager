import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:product_manager/models/product.dart';

class ProductsListView extends StatelessWidget {
  final List<QueryDocumentSnapshot<Object?>> documents;
  const ProductsListView({Key? key, required this.documents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> json = documents[index].data()! as Map<String, dynamic>;
        var product = Product.fromJson(json);
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(product.name ?? "", style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 18)),
                const SizedBox(height: 4),
                Text(product.description ?? ""),
                const SizedBox(height: 6),
                Text(
                  '${product.price ?? ""} K.D',
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 18, color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
