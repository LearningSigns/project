import 'package:flutter/material.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({
    super.key,
    required this.titleApp,
  });
  final String titleApp;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleApp.isEmpty ? 'Bienvenido!' : titleApp,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
      // actions: [
      //   IconButton(
      //     icon: const Icon(Icons.settings),
      //     onPressed: () {
      //       // Acción para el icono de configuración
      //     },
      //   ),
      // ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: ColorsApp.white,
          // gradient: LinearGradient(
          //   colors: [ColorsApp.secondary, ColorsApp.white, ColorsApp.secondary],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
