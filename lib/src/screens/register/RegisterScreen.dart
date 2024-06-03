import 'package:flutter/material.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

import '../../componets/componets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          
          Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 45.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // Borde redondeado de 20
                            image: const DecorationImage(
                              image: AssetImage('assets/image/logo_without_background.png'),
                              fit: BoxFit
                                  .cover, // Ajusta la imagen para cubrir el contenedor
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Regístrate ahora y sé parte de nuestra comunidad',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: 60.0,
                          //   child: TextFormField(
                          //     autocorrect: false,
                          //     onChanged: (value) => {},
                          //     decoration: const InputDecoration(
                          //       filled: true,
                          //       fillColor: ColorsApp.white,
                          //       hintText: 'Ingresa tu correo electronico',
                          //       labelText: 'Email',
                          //       floatingLabelBehavior:
                          //           FloatingLabelBehavior.auto,
                          //       floatingLabelAlignment:
                          //           FloatingLabelAlignment.start,
                          //     ),
                          //     style: const TextStyle(
                          //       color: ColorsApp.textColor,
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            height: 60.0,
                            child: TextFormField(
                              autocorrect: false,
                              onChanged: (value) => {},
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: ColorsApp.white,
                                hintText: 'Ingresa tu usuario',
                                labelText: 'Usuario',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.start,
                              ),
                              style: const TextStyle(
                                color: ColorsApp.textColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            height: 60.0,
                            child: TextFormField(
                              autocorrect: false,
                              onChanged: (value) => {},
                              obscureText: true,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: ColorsApp.white,
                                hintText: 'Ingresa tu contraseña',
                                labelText: 'Contraseña',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.start,
                              ),
                              style: const TextStyle(
                                color: ColorsApp.textColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            height: 60.0,
                            child: TextFormField(
                              autocorrect: false,
                              onChanged: (value) => {},
                              obscureText: true,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: ColorsApp.white,
                                hintText: 'Ingresa tu contraseña nuevamente',
                                labelText: 'Confirma tu contraseña',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.start,
                              ),
                              style: const TextStyle(
                                color: ColorsApp.textColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ButtonPrimary(
                            screenSize: screenSize,
                            title: 'Crear cuenta',
                            colorFondo: ColorsApp.secondary,
                            colorLetra: ColorsApp.white,
                            onTap: () async {
                              Navigator.pushNamed(context, 'second');
                            },
                            colorBorde: ColorsApp.secondary,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('¿Tienes cuenta?',
                                  style: TextStyle(fontSize: 16)),
                              const SizedBox(
                                width: 10.0,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'login');
                                  },
                                  child: const Text(
                                    'Iniciar sesión',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ))
                            ],
                          )
                        ],
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
