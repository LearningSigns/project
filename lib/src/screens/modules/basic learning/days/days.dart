import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class DaysScreen extends StatelessWidget {
  const DaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listadoDias = [
      'Días',
      'Lunes',
      'Martes',
      'Miercoles',
      'Jueves',
      'Viernes',
      'Sabado',
      'Domingo',
    ];

    return Scaffold(
        appBar: const AppBarHome(
          titleApp: 'Días',
        ),
        drawer: const SideMenu(),
        body: Stack(
          children: [
            const BackgroundImage(),
            Expanded(
              child: ListView.builder(
                itemCount: listadoDias.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción cuando se presiona el botón
                        print('Presionado: ${listadoDias[index]}');
                        Navigator.pushNamed(
                          context,
                          'item',
                          arguments: listadoDias[index],
                        );
                      },
                      child: Text(
                        listadoDias[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: ColorsApp.secondary),
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
