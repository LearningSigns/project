import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class FistPageScreen extends StatefulWidget {
  const FistPageScreen({super.key});

  @override
  State<FistPageScreen> createState() => _FistPageScreenState();
}

class _FistPageScreenState extends State<FistPageScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/image/background_screem.jpeg'), // Ruta de la imagen de fondo
              fit: BoxFit.cover, // Ajusta la imagen para cubrir todo el espacio
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
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  40), // Borde redondeado de 20
                              image: const DecorationImage(
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
                        const Center(
                          child: Text(
                            'LEARNING SIGNS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Aplicación móvil para la enseñanza de la lengua de señas colombiana',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ButtonPrimary(
                          screenSize: screenSize,
                          title: 'Iniciemos!',
                          colorFondo: ColorsApp.secondary,
                          colorLetra: ColorsApp.white,
                          onTap: () async {
                            Navigator.pushNamed(context, 'login');
                          },
                          colorBorde: ColorsApp.secondary,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}
