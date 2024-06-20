import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toasty_box.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  void _register() async {
    if (passwordController.text != repeatPasswordController.text) {
      ToastService.showErrorToast(
        context,
        length: ToastLength.medium,
        expandedHeight: 100,
        message: "Las contraseñas no son iguales.",
      );
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userController.text,
        password: passwordController.text,
      );

      // Añadir el usuario a Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'age': '',
        'born_day': '',
        'email': userController.text,
        'full_name': '',
        'phonenumber': '',
        'photo': '',
      });

      // ignore: use_build_context_synchronously
      ToastService.showSuccessToast(
        context,
        length: ToastLength.medium,
        expandedHeight: 100,
        message: "Creación exitosa!",
      );
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'login');
    } catch (e) {
      print('Failed to register: $e');
      ToastService.showErrorToast(
        context,
        length: ToastLength.medium,
        expandedHeight: 100,
        message: "Error al registrar: $e",
      );
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
                    height: 600,
                    child: Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            const Text(
                              'Regístrate ahora y sé parte de nuestra comunidad',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 50.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                CustomTextFormField(
                                  icon: Icons.lock,
                                  iconColor: ColorsApp.textColor,
                                  hintText: 'Ingresa tu contraseña nuevamente',
                                  labelText: 'Confirma tu contraseña',
                                  controller: repeatPasswordController,
                                  onChanged: (value) {},
                                  disabledField: true,
                                ),
                                const SizedBox(height: 20.0),
                                ButtonPrimary(
                                  screenSize: screenSize,
                                  title: 'Crear cuenta',
                                  colorFondo: ColorsApp.secondary,
                                  colorLetra: ColorsApp.white,
                                  onTap: _register,
                                  colorBorde: ColorsApp.secondary,
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('¿Tienes cuenta?',
                                        style: TextStyle(fontSize: 16)),
                                    const SizedBox(width: 10.0),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, 'login');
                                      },
                                      child: const Text(
                                        'Iniciar sesión',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
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
        ],
      ),
    );
  }
}
