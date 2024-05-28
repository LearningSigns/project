import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      children: [
                        const Text(
                          'Bienvenidos!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
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
                                    image: AssetImage('assets/image/logo.jpg'),
                                    fit: BoxFit
                                        .cover, // Ajusta la imagen para cubrir el contenedor
                                  ),
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
                            ButtonPrimary(
                              screenSize: screenSize,
                              title: 'Ingresar',
                              colorFondo: ColorsApp.secondary,
                              colorLetra: ColorsApp.white,
                              onTap: () async {
                                Navigator.pushNamed(context, 'welcome');
                              },
                              colorBorde: ColorsApp.secondary,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '¿No tienes cuenta?',
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, 'register');
                                    },
                                    child: const Text(
                                      'Registrar ahora.',
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
        ));
  }
}
