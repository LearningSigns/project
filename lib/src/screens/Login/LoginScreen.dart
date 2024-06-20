// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toasty_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userController.text,
        password: passwordController.text,
      );
      // ignore: use_build_context_synchronously
      ToastService.showSuccessToast(
        context,
        length: ToastLength.medium,
        expandedHeight: 100,
        message: "Login exitoso!",
      );
      Navigator.pushNamed(context, 'home');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print('entro');
      ToastService.showErrorToast(context,
          length: ToastLength.medium,
          expandedHeight: 100,
          message: "Usuario o contraseña incorrectos",
          dismissDirection: DismissDirection.up);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                color: ColorsApp.white,
                shadowColor: ColorsApp.textColor,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    height: 500,
                    child: Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 45.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/image/logo_without_background.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  CustomTextFormField(
                                    icon: Icons.person,
                                    iconColor: ColorsApp.textColor,
                                    hintText: 'Ingresa tu usuario',
                                    labelText: 'Usuario',
                                    controller: userController,
                                    onChanged: (value) {},
                                    disabledField: true,
                                  ),
                                  const SizedBox(height: 20.0),
                                  CustomTextFormField(
                                    icon: Icons.lock,
                                    iconColor: ColorsApp.textColor,
                                    hintText: 'Ingresa tu contraseña',
                                    labelText: 'Contraseña',
                                    controller: passwordController,
                                    onChanged: (value) {},
                                    disabledField: true,
                                  ),
                                  const SizedBox(height: 20.0),
                                  ButtonPrimary(
                                    screenSize: screenSize,
                                    title: 'Ingresar',
                                    colorFondo: ColorsApp.secondary,
                                    colorLetra: ColorsApp.white,
                                    onTap: _login,
                                    colorBorde: ColorsApp.secondary,
                                  ),
                                  const SizedBox(height: 20.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        '¿No tienes cuenta?',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(width: 10.0),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, 'register');
                                        },
                                        child: const Text(
                                          'Registrar ahora.',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
