// ignore: file_names
import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listadoFamilia = [
      "Mamá",
      "Papá",
      "Hermano-a",
      "Hijo-a",
      "Abuelo-a",
      "Tío-a",
      "Primo-a",
      "Amigo-a",
      "Sobrino-a",
      "Esposo-a",
      "Suegro-a",
      "Cuñado-a",
    ];

    return Scaffold(
        appBar: const AppBarHome(
          titleApp: 'Familia',
        ),
        drawer: const SideMenu(),
        body: Stack(
          children: [
            const BackgroundImage(),
            Expanded(
              child: ListView.builder(
                itemCount: listadoFamilia.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'item',
                          arguments: {
                            'item': listadoFamilia[index],
                            'returnItem': 'family'
                          },
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorsApp.secondary)),
                      child: Text(
                        listadoFamilia[index],
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
