



import 'package:flutter/material.dart';

class OneForAll extends StatelessWidget {
  final String name;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  const OneForAll({super.key, required this.name,this.textStyle,this.onPressed });

  @override
  Widget build(BuildContext context) {
    TextStyle finalTextStyle = textStyle ?? TextStyle(fontSize: 20);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: onPressed,
          child: Text(name,style: finalTextStyle,)),
    );
  }
}
