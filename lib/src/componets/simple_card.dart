import 'package:flutter/material.dart';

class SampleCard extends StatelessWidget {
  const SampleCard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(child: Text(cardName)),
    );
  }
}
