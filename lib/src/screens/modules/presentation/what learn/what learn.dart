import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:learning_sings/src/componets/componets.dart';

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
    List<String> listadoNumeros = [
      '¿Quiénes somos?',
    ];

    return Scaffold(
      appBar: const AppBarHome(
        titleApp: '¿Qué vas a aprender?',
      ),
      drawer: const SideMenu(),
      body: Stack(
        children: [
          const BackgroundImage(),
          Center(
            child: SizedBox(
              // width: 300,
              // height: 700,
              child: Gif(
                image: const AssetImage("assets/gif/Que vas aprender.gif"),
                controller:
                    _controller, // if duration and fps is null, original gif fps will be used.
                // fps: 30,
                // duration: const Duration(seconds: 3),
                autostart: Autostart.loop,
                placeholder: (context) => const Text('Loading...'),
                onFetchCompleted: () {
                  _controller.reset();
                  _controller.forward();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
