import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/image/background_screem.jpeg'), // Ruta de la imagen de fondo
          fit: BoxFit.cover, // Ajusta la imagen para cubrir todo el espacio
        ),
      ),
    );
  }
}
