import 'package:flutter/material.dart';

class Utilisateur extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Utilisateur();
  }
}

class _Utilisateur extends State<Utilisateur> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Column(),
        ),
        Expanded(
          flex: 7,
          child: Column(),
        )
      ],
    );
  }
}
