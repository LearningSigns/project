import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class WhoWeAreScreen extends StatefulWidget {
  const WhoWeAreScreen({super.key});

  @override
  _WhoWeAreScreenState createState() => _WhoWeAreScreenState();
}

class _WhoWeAreScreenState extends State<WhoWeAreScreen>
    with TickerProviderStateMixin {
  late GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(
        titleApp: '¿Quiénes somos?',
      ),
      drawer: const SideMenu(),
      body: Stack(
        children: [
          const BackgroundImage(),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'item',
                        arguments: {
                          'item': '¿Quiénes somos?',
                          'returnItem': 'whoweare'
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ColorsApp.secondary),
                      minimumSize:
                          MaterialStateProperty.all(const Size(480, 40)),
                    ),
                    child: const Text(
                      '¿Quiénes somos?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ColorsApp.white),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'whowearedescription');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ColorsApp.secondary),
                      minimumSize:
                          MaterialStateProperty.all(const Size(480, 40)),
                    ),
                    child: const Text(
                      'Descripción',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ColorsApp.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
