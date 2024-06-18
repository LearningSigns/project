import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class WhatLearnScreen extends StatefulWidget {
  const WhatLearnScreen({super.key});

  @override
  _WhatLearnScreenState createState() => _WhatLearnScreenState();
}

class _WhatLearnScreenState extends State<WhatLearnScreen>
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
        titleApp: '¿Qué vas a aprender?',
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
                          'item': '¿Qué vas a aprender?',
                          'returnItem': 'whatlearn'
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
                      '¿Qué vas a aprender?',
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
                      Navigator.pushNamed(context, 'whatlearndescription');
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
