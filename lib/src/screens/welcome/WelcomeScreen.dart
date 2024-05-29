import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // Lista de opciones para el Dropdown
  final List<String> _dropdownItems = ['Opción 1', 'Opción 2', 'Opción 3'];

  // Variable para almacenar el valor seleccionado
  String? _selectedItem;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              20), // Borde redondeado de 20
                          image: const DecorationImage(
                            image: AssetImage('assets/image/logo.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Learning Signs",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                title: const Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(Icons.home),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Presentación",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ],
                        ))
                  ],
                ),
                childrenPadding: const EdgeInsets.all(4),
                tilePadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: Colors.transparent,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (() {}),
                      child: const Row(
                        children: [
                          Text(
                            "¿Quiénes somos?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (() {}),
                      child: const Row(
                        children: [
                          Text(
                            "¿Qué vas a aprender?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(Icons.filter_1),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Módulo. Aprendizaje inicial",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ],
                        ))
                  ],
                ),
                childrenPadding: const EdgeInsets.all(4),
                tilePadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: Colors.transparent,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (() {}),
                      child: const Row(
                        children: [
                          Text(
                            "Introducción",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (() {}),
                      child: const Row(
                        children: [
                          Text(
                            "Abecedario",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (() {}),
                      child: const Row(
                        children: [
                          Text(
                            "Presentación personal 1",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (() {}),
                      child: const Row(
                        children: [
                          Text(
                            "Saludos",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (() {}),
                      child: const Row(
                        children: [
                          Text(
                            "Familia",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(Icons.filter_2),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Módulo. Aprendizaje básico",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ],
                        ))
                  ],
                ),
                childrenPadding: const EdgeInsets.all(4),
                tilePadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: Colors.transparent,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (() {}),
                      child: const Row(
                        children: [
                          Text(
                            "Introducción",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (() {}),
                      child: const Row(
                        children: [
                          Text(
                            "Números",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (() {}),
                      child: const Row(
                        children: [
                          Text(
                            "Días, meses y años",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: (() {}),
                      child: const Row(
                        children: [
                          Text(
                            "Presentación",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(
                  'Ajustes',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/image/background_app.jpg'), // Ruta de la imagen de fondo
                  fit: BoxFit
                      .cover, // Ajusta la imagen para cubrir todo el espacio
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 45.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                  ),
                ))
          ],
        )
        );
  }
}
