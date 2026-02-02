
import 'package:flutter/material.dart';



class NavigatorBar extends StatelessWidget
{
  final VoidCallback press;

  const NavigatorBar({super.key, required this.press});

  @override
  Widget build(BuildContext context){

    return TextButton(
      // style: ButtonStyle(),
      onPressed: press, child: Text("back"));

  }

}