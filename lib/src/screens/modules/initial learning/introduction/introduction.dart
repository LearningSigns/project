import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';
import 'package:video_player/video_player.dart';

class IntroductionModuleOneScreen extends StatefulWidget {
  const IntroductionModuleOneScreen({super.key});

  @override
  _IntroductionModuleOneScreenState createState() =>
      _IntroductionModuleOneScreenState();
}

class _IntroductionModuleOneScreenState
    extends State<IntroductionModuleOneScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/learning-signs-2fd82.appspot.com/o/DescriptionModule1.mp4?alt=media&token=ddae1537-acea-48b6-82e5-dbb7691e07d2'))
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
        titleApp: 'Introducción I',
      ),
      drawer: const SideMenu(),
      body: Stack(
        children: [
          const BackgroundImage(),
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
        foregroundColor: ColorsApp.white ,
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
