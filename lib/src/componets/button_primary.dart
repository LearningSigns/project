import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    Key? key,
    required this.screenSize, required this.title, required this.colorFondo, required this.colorLetra, required this.onTap, required this.colorBorde,
  }) : super(key: key);

  final Size screenSize;
  final String title;
  final Color colorFondo;
  final Color colorLetra;
  final Color colorBorde;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.symmetric( vertical: 8.0, horizontal: 1.0),
      child: ElevatedButton(
        onPressed: (){
          onTap();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorFondo, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: colorBorde)),
          elevation: 8.0, // Elevación (sombra) del botón
          padding: const EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 20.0),
        ),
        child: SizedBox(
          width: screenSize.width * 0.9,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: colorLetra,
            ),
          ),
        ),
      ),
    );
  }
}
