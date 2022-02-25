import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? label;
  final void Function()? onPressed;
  const RoundedButton({Key? key, this.label, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.85,
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(label ?? ""),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          ),
        ),
      ),
    );
  }
}
