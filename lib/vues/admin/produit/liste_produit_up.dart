import 'package:flutter/material.dart';

class ListageProduitUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.blueAccent.shade100,
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(),
        ),
      ],
    );
  }
}
