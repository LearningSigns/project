// ignore: file_names
import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class PersonalPresentationScreen extends StatelessWidget {
  const PersonalPresentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listadoPresentacionPersonal = [
      "Presentación personal I",
      "Mi nombre",
      "Pon a prueba tus conocimientos",
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
                itemCount: listadoPresentacionPersonal.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'item',
                          arguments: {
                            'item': listadoPresentacionPersonal[index],
                            'returnItem': 'presentation_i'
                          },
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorsApp.secondary)),
                      child: Text(
                        listadoPresentacionPersonal[index],
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
