import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';
import 'package:video_player/video_player.dart';

class EvaluateYourKnowledgeScreen extends StatefulWidget {
  const EvaluateYourKnowledgeScreen({super.key});

  @override
  _EvaluateYourKnowledgeScreenState createState() =>
      _EvaluateYourKnowledgeScreenState();
}

class _EvaluateYourKnowledgeScreenState
    extends State<EvaluateYourKnowledgeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/learning-signs-2fd82.appspot.com/o/EvaluateYourKnowledge.mp4?alt=media&token=251328ab-b992-4fb7-94b8-cde3ef1c4c17'))
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
        titleApp: 'Evalua tus conocimientos',
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
