import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart'; // Corrección del nombre del paquete
import 'package:learning_sings/src/theme/app_theme.dart'; // Asegúrate que ColorsApp esté definido en app_theme.dart

class DaysScreen extends StatelessWidget {
  const DaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listadoDias = [
      'Días de la semana',
      'Lunes',
      'Martes',
      'Miércoles',
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
          Positioned.fill(
            child: ListView.builder(
              itemCount: listadoDias.length,
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
                          'item': listadoDias[index],
                          'returnItem': 'day'
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        ColorsApp.secondary,
                      ),
                    ),
                    child: Text(
                      listadoDias[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: ColorsApp.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
