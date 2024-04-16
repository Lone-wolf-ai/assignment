import 'package:assignment/constant/colorconstant.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:assignment/constant/imageconstant.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;


  const CustomVideoPlayer({
    super.key,
    required this.videoUrl,

  });

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:160 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 98, 63, 252),
            Color.fromRGBO(3, 157, 85, 0),
          ],
          stops: [0.4206, 1.0],
        ),
      ),
      child: Stack(
        children: [
          if (isPlaying)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(_videoPlayerController),
                ),
              ),
            ),
          if (!isPlaying)
            Positioned.fill(
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  ImageConstant.backgroundimg,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isPlaying = !isPlaying;
                  if (isPlaying) {
                    _videoPlayerController.play();
                  } else {
                    _videoPlayerController.pause();
                  }
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration:  BoxDecoration(
                  
                  color: AppColor.purple,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2,color: Colors.white)
                ),
                child: Icon(
                  
                  isPlaying ? Icons.pause : Icons.play_arrow_outlined,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
