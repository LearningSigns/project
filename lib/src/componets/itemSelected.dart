
import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/AppbarCustom.dart';
import 'package:learning_sings/src/componets/side_menu.dart';


class ItemSelected extends StatelessWidget {
  const ItemSelected({super.key, required this.item});
  final String item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(titleApp: item,),
      drawer: const SideMenu(),
      body: Center(
        child: Text('Has selecionado $item'),
     ),
   );
  }
}
