import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainHeader extends StatelessWidget {
  final Widget? child;
  const MainHeader({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: child,
    );
  }
}