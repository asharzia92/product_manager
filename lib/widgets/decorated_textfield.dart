import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecoratedTextfield extends StatefulWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? suffixText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;

  const DecoratedTextfield(
      {Key? key,
      this.controller,
      this.placeholder,
      this.suffixText,
      this.icon,
      this.keyboardType,
      this.textCapitalization = TextCapitalization.none,
      this.validator})
      : super(key: key);

  @override
  State<DecoratedTextfield> createState() => _DecoratedTextfieldState();
}

class _DecoratedTextfieldState extends State<DecoratedTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        hintText: widget.placeholder,
        suffixIcon: Icon(widget.icon),
        suffixText: widget.suffixText,
      ),
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
    );
  }
}
