import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class AlphabetScreen extends StatelessWidget {
  const AlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listadoAlfabeto = [
      "Abecedario",
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L-LL",
      "M",
      "N",
      "Ñ",
      "O",
      "P",
      "Q",
      "R",
      "RR",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z"
    ];

    return Scaffold(
        appBar: const AppBarHome(
          titleApp: 'Abecedario',
        ),
        drawer: const SideMenu(),
        body: Stack(
          children: [
            const BackgroundImage(),
            Expanded(
              child: ListView.builder(
                itemCount: listadoAlfabeto.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'item',
                          arguments: listadoAlfabeto[index],
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorsApp.secondary)),
                      child: Text(
                        listadoAlfabeto[index],
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
