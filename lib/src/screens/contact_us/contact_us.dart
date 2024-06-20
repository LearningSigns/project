import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart'; // Importa este paquete para lanzar URLs

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(
        titleApp: 'Contáctanos',
      ),
      drawer: const SideMenu(),
      body: Stack(
        children: [
          const BackgroundImage(),
          Positioned.fill(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Puedes encontrarnos en:',
                    style:
                        TextStyle(fontSize: 16.0, color: ColorsApp.secondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      launch('https://www.instagram.com/learning_signs.app');
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.instagram,
                          color: ColorsApp.secondary,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '@learning_signs.app',
                          style: TextStyle(
                              fontSize: 16.0, color: ColorsApp.secondary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: ColorsApp.secondary,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'learningsignsaplicativomovil@gmail.com',
                          style: TextStyle(
                              fontSize: 16.0, color: ColorsApp.secondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
