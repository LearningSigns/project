import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({
    super.key, required this.titleApp,
  });
  final String titleApp;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleApp.isEmpty ? 'Bienvenido!'  : titleApp,
        style: const TextStyle(fontSize: 16.0),
      ),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Acción para el icono de configuración
          },
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 63, 79, 160), Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
