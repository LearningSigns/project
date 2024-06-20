import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

String getItemName(String item) {
  const Map<String, String> itemMap = {
    '¿Cómo estas?': 'Cómo estas',
    '¿Qué vas a aprender?': 'Qué vas a aprender',
  };

  return itemMap[item] ?? item;
}

class ItemSelected extends StatefulWidget {
  const ItemSelected({super.key, required this.item, required this.returnItem});
  final String item;
  final String returnItem;

  @override
  _ItemSelectedState createState() => _ItemSelectedState();
}

class _ItemSelectedState extends State<ItemSelected>
    with SingleTickerProviderStateMixin {
  late GifController _controller;
  String itemName = '';
  @override
  void initState() {
    itemName = getItemName(widget.item);
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
          const SizedBox(
            height: 20.0,
          ),
          TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, widget.returnItem);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Volver"),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(ColorsApp.secondary),
              )),
          Center(
            child: SizedBox(
              width: 340,
              height: 720,
              child: Gif(
                image: AssetImage('assets/gif/$itemName.gif'),
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
