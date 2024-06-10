import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listadoNumeros = [
      'Números',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '20',
      '30',
      '40',
      '50',
      '60',
      '70',
      '80',
      '90',
      '100',
      '200',
      '300',
      '400',
      '500',
      '600',
      '700',
      '800',
      '900',
      '1000',
      '2000',
      'Ejemplo de centenas',
      'Ejemplo de decenas'
    ];

    return Scaffold(
        appBar: const AppBarHome(
          titleApp: 'Números',
        ),
        drawer: const SideMenu(),
        body: Stack(
          children: [
            const BackgroundImage(),
            Expanded(
              child: ListView.builder(
                itemCount: listadoNumeros.length,
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
                            'item': listadoNumeros[index],
                            'returnItem': 'number'
                          },
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorsApp.secondary)),
                      child: Text(
                        listadoNumeros[index],
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
