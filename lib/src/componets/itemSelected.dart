import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:learning_sings/src/componets/componets.dart';

class ItemSelected extends StatefulWidget {
  const ItemSelected({super.key, required this.item});
  final String item;

  @override
  _ItemSelectedState createState() => _ItemSelectedState();
}

class _ItemSelectedState extends State<ItemSelected>
    with SingleTickerProviderStateMixin {
  late GifController _controller;

  @override
  void initState() {
    _controller = GifController(vsync: this);
    super.initState();
  }

  @override
  void didUpdateWidget(ItemSelected oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item != widget.item) {
      // Actualiza cualquier lógica o estado que dependa de widget.item
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(
        titleApp: widget.item,
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
                image: AssetImage('assets/gif/${widget.item}.gif'),
                controller: _controller,
                autostart: Autostart.loop,
                placeholder: (context) => const Text('Cargando...'),
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
