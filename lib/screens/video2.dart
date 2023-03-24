// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoApp2 extends StatefulWidget {
//   const VideoApp2({Key? key}) : super(key: key);
//
//   @override
//   _VideoApp2State createState() => _VideoApp2State();
// }
//
// class _VideoApp2State extends State<VideoApp2> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://iafpensioners.gov.in/i/VIDEO/IAFBA.mp4')
//     // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//           aspectRatio: _controller.value.aspectRatio,
//           child: VideoPlayer(_controller),
//         )
//             : Container(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _controller.value.isPlaying
//                 ? _controller.pause()
//                 : _controller.play();
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
class VideoApp2 extends StatefulWidget {
  const VideoApp2({Key? key}) : super(key: key);

  @override
  State<VideoApp2> createState() => _VideoApp2State();
}

class _VideoApp2State extends State<VideoApp2> {

  late VideoPlayerController controller;
  ChewieController? chewieController;

  Future<void> loadVideoPlayer() async{
    controller = VideoPlayerController.network('https://iafpensioners.gov.in/i/VIDEO/IAFBA.mp4');

    await Future.wait([
      controller.initialize()
    ]);

    chewieController = ChewieController(
      videoPlayerController: controller,
      fullScreenByDefault: true,

      autoPlay: false,
      looping: false,
    );
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    loadVideoPlayer();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    // ]);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    chewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Color(0xFFd3eaf2),
        title: Row(
          children: [
            Image(image: AssetImage("assets/images/dav-new-logo.png",
            ),
              fit: BoxFit.contain,
              height: 60,),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('VAYU-SAMPARC'))
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
              child: Center(
                child: chewieController !=null &&
                    chewieController!
                        .videoPlayerController.value.isInitialized
                    ?Chewie(controller: chewieController!)
                    :Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 20,),
                    Text("Loading",style: TextStyle(color: Colors.white),)
                  ],
                ),
              )),
        ],
      ),
    );
  }
}