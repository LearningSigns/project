import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';
import 'package:video_player/video_player.dart';

class WhoWeAreLearnDescriptionScreen extends StatefulWidget {
  const WhoWeAreLearnDescriptionScreen({super.key});

  @override
  _WhoWeAreLearnDescriptionScreenState createState() =>
      _WhoWeAreLearnDescriptionScreenState();
}

class _WhoWeAreLearnDescriptionScreenState
    extends State<WhoWeAreLearnDescriptionScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/learning-signs-2fd82.appspot.com/o/Description1.mp4?alt=media&token=13bbd765-f605-4cf5-aa34-6e4e2b3e4726'))
      ..initialize().then((_) {
        setState(() {});
      }).catchError((error, stackTrace) {});

    _controller.setLooping(true);
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
        titleApp: '¿Quiénes somos? - Descripción',
      ),
      drawer: const SideMenu(),
      body: Stack(
        children: [
          const BackgroundImage(),
          TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, 'whoweare');
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Volver"),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(ColorsApp.secondary),
              )),
          Center(
            child: _controller.value.isInitialized
                ? SizedBox(
                    height: 600,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : const CircularProgressIndicator(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.secondary,
        foregroundColor: ColorsApp.white,
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
