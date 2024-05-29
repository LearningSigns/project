import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/AppbarCustom.dart';
import 'package:learning_sings/src/componets/side_menu.dart';


class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});


  @override
  Widget build(BuildContext context) {

    List<String> listadoNumeros  = ['1', '2', '3', '4'];
    
    return Scaffold(
      appBar: const AppBarHome(titleApp: 'Numeros',),
      drawer: const SideMenu(),
      body: Expanded(
        child: ListView.builder(itemCount: listadoNumeros.length, itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón
                print('Presionado: ${listadoNumeros[index]}');
                Navigator.pushNamed(context, 'item', arguments: listadoNumeros[index],);
              },
              child: Text(listadoNumeros[index]),
            ),);
        },),
      ),
   );
  }
}
