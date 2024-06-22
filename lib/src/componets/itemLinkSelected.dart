import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class ItemLinkSelected extends StatefulWidget {
  const ItemLinkSelected(
      {super.key,
      required this.item,
      required this.linkItem,
      required this.returnItem});
  final String item;
  final String linkItem;
  final String returnItem;

  @override
  _ItemLinkSelectedState createState() => _ItemLinkSelectedState();
}

class _ItemLinkSelectedState extends State<ItemLinkSelected>
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
  void didUpdateWidget(ItemLinkSelected oldWidget) {
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
                image: NetworkImage(widget.linkItem),
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
