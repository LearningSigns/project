import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/AppbarCustom.dart';
import 'package:learning_sings/src/componets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const AppBarHome(titleApp: '',),
      drawer: const SideMenu(),
      body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/image/background_app.jpg'), // Ruta de la imagen de fondo
                  fit: BoxFit
                      .cover, // Ajusta la imagen para cubrir todo el espacio
                ),
              ),
            ),
            
            Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 45.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                  ),
                )),

              const Center( child: Text(' Este es el home'))
          ],
        ),
    );
  }
}

