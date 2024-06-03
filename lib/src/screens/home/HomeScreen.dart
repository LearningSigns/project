import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(
        titleApp: '',
      ),
      drawer: const SideMenu(),
      body: Stack(
        children: [
          const BackgroundImage(),
          Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 45.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            // Borde redondeado de 20
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/image/logo_without_background.png'),
                              fit: BoxFit
                                  .cover, // Ajusta la imagen para cubrir el contenedor
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Gracias por ser parte de la familia LEARNING SIGNS, dirígete a nuestro menú para que nos conozcas y empieces aprender con nosotros.',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
