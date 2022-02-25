import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _productsCollection = _firestore.collection('products');

class DatabaseHelper {
  static Future<void> addProduct({required String name, required String description, required String price}) async {
    DocumentReference documentReferencer = _productsCollection.doc("1234").collection('cakes').doc();
    Map<String, dynamic> data = <String, dynamic>{"name": name, "description": description, "price": price, "dateTime": Timestamp.fromDate(DateTime.now())};
    await documentReferencer.set(data).whenComplete(() => print("Product added to the database")).catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> getProducts() {
    CollectionReference cakesCollection = _productsCollection.doc("1234").collection('cakes');
    return cakesCollection.orderBy('dateTime', descending: true).snapshots();
  }
}
