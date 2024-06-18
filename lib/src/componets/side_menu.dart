import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_sings/src/theme/app_theme.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toasty_box.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  void _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navegar a la pantalla de inicio de sesión después de cerrar sesión
      Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
      // Mostrar mensaje de éxito
      ToastService.showSuccessToast(
        context,
        length: ToastLength.medium,
        expandedHeight: 100,
        message: "Sesión cerrada exitosamente.",
      );
    } catch (e) {
      print("Error al cerrar sesión: $e");
      // Mostrar mensaje de error
      ToastService.showErrorToast(
        context,
        length: ToastLength.medium,
        expandedHeight: 100,
        message: "Error al cerrar sesión.",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const CustomDrawerHeader(),
                ExpansionTile(
                  title: const Text('Presentacion'),
                  leading: const Icon(Icons.home),
                  childrenPadding: const EdgeInsets.all(4),
                  backgroundColor: Colors.transparent,
                  collapsedBackgroundColor: Colors.transparent,
                  children: [
                    ListTile(
                      title: const Text('¿Quiénes somos?'),
                      onTap: () {
                        Navigator.pushNamed(context, 'whoweare');
                      },
                    ),
                    ListTile(
                      title: const Text('¿Qué vas a aprender?'),
                      onTap: () {
                        Navigator.pushNamed(context, 'whatlearn');
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Módulo. Aprendizaje inicial'),
                  leading: const Icon(Icons.filter_1),
                  childrenPadding: const EdgeInsets.all(4),
                  backgroundColor: Colors.transparent,
                  collapsedBackgroundColor: Colors.transparent,
                  children: [
                    ListTile(
                      title: const Text('Introducción'),
                      onTap: () {
                        Navigator.pushNamed(context, 'introduction_1');
                      },
                    ),
                    ListTile(
                      title: const Text('Abecedario'),
                      onTap: () {
                        Navigator.pushNamed(context, 'alphabet');
                      },
                    ),
                    ListTile(
                      title: const Text('Presentación personal 1'),
                      onTap: () {
                        Navigator.pushNamed(context, 'presentation_i');
                      },
                    ),
                    ListTile(
                      title: const Text('Saludos'),
                      onTap: () {
                        Navigator.pushNamed(context, 'greetings');
                      },
                    ),
                    ListTile(
                      title: const Text('Familia'),
                      onTap: () {
                        Navigator.pushNamed(context, 'family');
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Módulo. Aprendizaje básico'),
                  leading: const Icon(Icons.filter_2),
                  childrenPadding: const EdgeInsets.all(4),
                  backgroundColor: Colors.transparent,
                  collapsedBackgroundColor: Colors.transparent,
                  children: [
                    ListTile(
                      title: const Text('Introducción'),
                      onTap: () {
                        Navigator.pushNamed(context, 'introduction_2');
                      },
                    ),
                    ListTile(
                      title: const Text('Días'),
                      onTap: () {
                        Navigator.pushNamed(context, 'day');
                      },
                    ),
                    ListTile(
                      title: const Text('Meses'),
                      onTap: () {
                        Navigator.pushNamed(context, 'month');
                      },
                    ),
                    ListTile(
                      title: const Text('Números'),
                      onTap: () {
                        Navigator.pushNamed(context, 'number');
                      },
                    ),
                    ListTile(
                      title: const Text('Años'),
                      onTap: () {
                        Navigator.pushNamed(context, 'year');
                      },
                    ),
                    ListTile(
                      title: const Text('Presentación'),
                      onTap: () {
                        Navigator.pushNamed(context, 'presentation_ii');
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Finalización'),
                  leading: const Icon(Icons.flag_circle),
                  childrenPadding: const EdgeInsets.all(4),
                  backgroundColor: Colors.transparent,
                  collapsedBackgroundColor: Colors.transparent,
                  children: [
                    ListTile(
                      title: const Text('Felicitaciones'),
                      onTap: () {
                        Navigator.pushNamed(context, 'congratulations');
                      },
                    ),
                    ListTile(
                      title: const Text('Evalua tus conocimientos'),
                      onTap: () {
                        Navigator.pushNamed(context, 'evaluate_your_knowledge');
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Ajustes'),
                  leading: const Icon(Icons.settings),
                  childrenPadding: const EdgeInsets.all(4),
                  backgroundColor: Colors.transparent,
                  collapsedBackgroundColor: Colors.transparent,
                  children: [
                    ListTile(
                      title: const Text('Perfil'),
                      onTap: () {
                        Navigator.pushNamed(context, 'profile');
                      },
                    ),
                    ListTile(
                      title: const Text('Cerrar sesión'),
                      onTap: () {
                        _signOut(); // Asegúrate de llamar a la función
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.outbond_rounded),
                title: const Text('Contáctanos '),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: ColorsApp.secondary,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/image/logo_without_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'LEARNING SIGNS',
                style: TextStyle(
                  color: ColorsApp.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
