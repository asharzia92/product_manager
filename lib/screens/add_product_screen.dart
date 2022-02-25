import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_manager/components/custom_appbar.dart';
import 'package:product_manager/utils/helper_classes/database_helper.dart';
import 'package:product_manager/utils/helper_classes/snack_bar_helper.dart';
import 'package:product_manager/widgets/decorated_textfield.dart';
import 'package:product_manager/widgets/rounded_button.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Add Product"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DecoratedTextfield(
                controller: nameController,
                placeholder: "Product Name",
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required";
                  } else if (value.length < 3) {
                    return "Name length should be 3 or more";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 16),
              DecoratedTextfield(
                controller: descController,
                placeholder: "Product Description",
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required";
                  } else if (value.length < 3) {
                    return "Description length should be 3 or more";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 16),
              DecoratedTextfield(
                controller: priceController,
                placeholder: "Product Price",
                suffixText: "K.D",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 16),
              RoundedButton(
                label: "Submit",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await DatabaseHelper.addProduct(name: nameController.text, description: descController.text, price: priceController.text);
                    SnackBarHelper.showSnackBar(context: context, text: "Product was added successfully", icon: Icons.done);
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
