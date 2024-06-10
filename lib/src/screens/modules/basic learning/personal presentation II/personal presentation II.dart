import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class PresentationPersonalIIScreen extends StatelessWidget {
  const PresentationPersonalIIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listado = [
      'Presentación personal II',
      'Mi nombre',
      'Nacimiento',
      'Cumpleaños',
      'Mi edad',
    ];

    return Scaffold(
        appBar: const AppBarHome(
          titleApp: 'Presentación Personal II',
        ),
        drawer: const SideMenu(),
        body: Stack(
          children: [
            const BackgroundImage(),
            Expanded(
              child: ListView.builder(
                itemCount: listado.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción cuando se presiona el botón
                        Navigator.pushNamed(
                          context,
                          'item',
                          arguments: {
                            'item': listado[index],
                            'returnItem': 'presentation_ii'
                          },
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorsApp.secondary)),
                      child: Text(
                        listado[index],
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
