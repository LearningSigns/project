import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';
import 'package:video_player/video_player.dart';

class IntroductionModuleTwoScreen extends StatefulWidget {
  const IntroductionModuleTwoScreen({super.key});

  @override
  _IntroductionModuleTwoScreenState createState() =>
      _IntroductionModuleTwoScreenState();
}

class _IntroductionModuleTwoScreenState
    extends State<IntroductionModuleTwoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/learning-signs-2fd82.appspot.com/o/DescriptionModule2.mp4?alt=media&token=77136bf6-849f-446e-82fa-58f968a821c8'))
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
        titleApp: 'Introducción II',
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
