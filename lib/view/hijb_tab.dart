import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HijbTab extends StatelessWidget {
  const HijbTab({super.key});

  @override
  Widget build(BuildContext context) {
    return buildContainer();
  }

  Container buildContainer() {
    return Container(
    child: Text(
      'Hijb',
      style: TextStyle(color: Colors.black),
    ),
  );
  }
}
