import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:learning_sings/src/componets/componets.dart';

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
          Center(
              child: SizedBox(
            // width: 300,
            // height: 700,
            child: Gif(
              image: const AssetImage("assets/gif/Quienes somos.gif"),
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
          ))
        ],
      ),
    );
  }
}
