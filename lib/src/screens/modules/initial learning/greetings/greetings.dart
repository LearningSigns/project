// ignore: file_names
import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class GreetingsScreen extends StatelessWidget {
  const GreetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listadoSaludos = [
      "Saludos",
      "Hola",
      "¿Cómo estas?",
      "Respuestas",
      "Bien, mal, regular",
      "Adíos",
      "Gracias",
      "De nada",
      "Buenos días",
      "Buenas tardes",
      "Buenas noches",
      "Lo siento",
      "Por favor",
      "Permiso",
    ];

    return Scaffold(
        appBar: const AppBarHome(
          titleApp: 'Saludos',
        ),
        drawer: const SideMenu(),
        body: Stack(
          children: [
            const BackgroundImage(),
            Positioned.fill(
              child: ListView.builder(
                itemCount: listadoSaludos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'item',
                          arguments: {
                            'item': listadoSaludos[index],
                            'returnItem': 'greetings'
                          },
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorsApp.secondary)),
                      child: Text(
                        listadoSaludos[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: ColorsApp.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
