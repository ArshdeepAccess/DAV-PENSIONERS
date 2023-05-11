// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';
// class VideoApp2 extends StatefulWidget {
//   const VideoApp2({Key? key}) : super(key: key);
//
//   @override
//   _VideoApp2State createState() => _VideoApp2State();
// }
//
// class _VideoApp2State extends State<VideoApp2> {
//
//   late VideoPlayerController controller;
//   ChewieController? chewieController;
//   bool _isLoading = true;
//
//    Future<void> _seekBackward() async {
//     final position = await controller.position;
//     final Duration backwardDuration = Duration(seconds: 10);
//     final newPosition = position! - backwardDuration;
//     if (newPosition.inMilliseconds < 0) {
//       await controller.seekTo(Duration.zero);
//     } else {
//       await controller.seekTo(newPosition);
//     }
//   }
//
//   Future<void> _seekForward() async {
//     final position = await controller.position;
//     final Duration forwardDuration = Duration(seconds: 10);
//     final newPosition = position! + forwardDuration;
//     final duration = controller.value.duration;
//     if (newPosition >= duration!) {
//       await controller.seekTo(duration);
//     } else {
//       await controller.seekTo(newPosition);
//     }
//   }
//   Future<void> loadVideoPlayer() async{
//     controller = VideoPlayerController.network('https://iafpensioners.gov.in/i/VIDEO/IAFBA.mp4');
//
//     await Future.wait([
//       controller.initialize()
//     ]);
//
//     setState(() {
//       chewieController = ChewieController(
//         videoPlayerController: controller,
//         aspectRatio: 16/9,
//         autoPlay: false,
//         looping: false,
//         materialProgressColors: ChewieProgressColors(
//           playedColor: Colors.red,
//           handleColor: Colors.redAccent,
//           backgroundColor: Colors.grey,
//           bufferedColor: Colors.white,
//         ),
//         placeholder: Container(
//           color: Colors.grey,
//         ),
//         autoInitialize: true,
//         overlay: Stack(
//           children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child:IconButton(
//                             onPressed: _seekBackward,
//                             icon: Icon(Icons.replay_10, color: Colors.white),
//                           ),
//             ),
//
//             Align(
//               alignment: Alignment.centerRight,
//               child:  IconButton(
//                             onPressed: _seekForward,
//                             icon: Icon(Icons.forward_10, color: Colors.white),
//                           ),
//             ),
//           ],
//         ),
//       );
//       _isLoading = false;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     loadVideoPlayer();
//     // SystemChrome.setPreferredOrientations([
//     //   DeviceOrientation.landscapeRight,
//     // ]);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//     chewieController!.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//
//       backgroundColor: Colors.black,
//
//       appBar: AppBar(
//         backgroundColor: Color(0xFFd3eaf2),
//         title: Row(
//           children: [
//             Image(
//               image: AssetImage("assets/images/dav-new-logo.png"),
//               fit: BoxFit.contain,
//               height: 60,
//             ),
//             Container(
//               padding: const EdgeInsets.all(8.0),
//               child: Text('VAYU-SAMPARC'),
//             ),
//           ],
//         ),
//       ),
//
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: chewieController != null &&
//                   chewieController!.videoPlayerController.value.isInitialized
//                   ? Chewie(controller: chewieController!)
//                   : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 20,),
//                   Text("Loading",style: TextStyle(color: Colors.white),)
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoApp2 extends StatefulWidget {
  const VideoApp2({Key? key}) : super(key: key);

  @override
  _VideoApp2State createState() => _VideoApp2State();
}

class _VideoApp2State extends State<VideoApp2> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;
  bool _isFullScreen = false;
  DeviceOrientation? preferredOrientation;
  Duration _currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://iafpensioners.gov.in/i/VIDEO/IAFBA.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.addListener(() {
      setState(() {
        _currentPosition = _controller.value.position;
      });
    });
  }
  String _formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(2, '0');
    String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return (duration.inHours > 0) ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playPause() async {
    if (_isPlaying) {
      await _controller.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      await _controller.play();
      setState(() {
        _isPlaying = true;
      });
    }
  }

  Future<void> _seekBackward() async {
    final position = await _controller.position;
    final Duration backwardDuration = Duration(seconds: 10);
    final newPosition = position! - backwardDuration;
    if (newPosition.inMilliseconds < 0) {
      await _controller.seekTo(Duration.zero);
    } else {
      await _controller.seekTo(newPosition);
    }
  }

  Future<void> _seekForward() async {
    final position = await _controller.position;
    final Duration forwardDuration = Duration(seconds: 10);
    final newPosition = position! + forwardDuration;
    final duration = _controller.value.duration;
    if (newPosition >= duration!) {
      await _controller.seekTo(duration);
    } else {
      await _controller.seekTo(newPosition);
    }
  }

  Future<void> _toggleFullScreen() async {
    final bool isFullScreen = await _controller.value.isPlaying &&
        MediaQuery.of(context).orientation == Orientation.portrait;

    if (isFullScreen) {
      // Exit full screen mode
      preferredOrientation = null;
      setState(() {
        _isFullScreen = false;
      });
    } else {
      // Enter full screen mode
      final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
      preferredOrientation = isPortrait ? DeviceOrientation.landscapeLeft : null;
      setState(() {
        _isFullScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      if (preferredOrientation != null) {
        SystemChrome.setPreferredOrientations([preferredOrientation!]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: isPortrait ? AppBar(
          backgroundColor: Color(0xFFd3eaf2),
          title: Row(
            children: [
              Image(
                image: AssetImage("assets/images/dav-new-logo.png"),
                fit: BoxFit.contain,
                height: 60,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('VAYU-SAMPARC'),
              ),
            ],
          ),
        ) : null,
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Center(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: _seekBackward,
                            icon: Icon(Icons.replay_10, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: _playPause,
                            icon: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: _seekForward,
                            icon: Icon(Icons.forward_10, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: _toggleFullScreen,
                            icon: Icon(
                              _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: Colors.red,
                          backgroundColor: Colors.black,
                        ),
                        padding: EdgeInsets.only(top: 10.0),
                        // timeLabelTextStyle: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          '${_formatDuration(_currentPosition)} / ${_formatDuration(_controller.value.duration ?? Duration.zero)}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  });}
}


// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
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
//
//   late VideoPlayerController controller;
//   ChewieController? chewieController;
//
//   Future<void> loadVideoPlayer() async{
//     controller = VideoPlayerController.network('https://iafpensioners.gov.in/i/VIDEO/IAFBA.mp4');
//
//     await Future.wait([
//       controller.initialize()
//     ]);
//
//     chewieController = ChewieController(
//       videoPlayerController: controller,
//       aspectRatio: 9 / 6,
//       autoPlay: false,
//       looping: false,
//       materialProgressColors: ChewieProgressColors(
//         playedColor: Colors.red,
//         handleColor: Colors.redAccent,
//         backgroundColor: Colors.grey,
//         bufferedColor: Colors.white,
//       ),
//       placeholder: Container(
//         color: Colors.grey,
//       ),
//       autoInitialize: true,
//       overlay: Stack(
//         children: [
//           Align(
//             alignment: Alignment.centerLeft,
//             child: IconButton(
//               icon: Icon(Icons.replay_10, color: Colors.white),
//               onPressed: () {
//                 controller.seekTo(controller.value.position - Duration(seconds: 10));
//               },
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: IconButton(
//               icon: Icon(Icons.forward_10, color: Colors.white),
//               onPressed: () {
//                 controller.seekTo(controller.value.position + Duration(seconds: 10));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     loadVideoPlayer();
//     // SystemChrome.setPreferredOrientations([
//     //   DeviceOrientation.landscapeRight,
//     // ]);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//     chewieController!.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//
//       appBar: AppBar(
//         backgroundColor: Color(0xFFd3eaf2),
//         title: Row(
//           children: [
//             Image(
//               image: AssetImage("assets/images/dav-new-logo.png"),
//               fit: BoxFit.contain,
//               height: 60,
//             ),
//             Container(
//               padding: const EdgeInsets.all(8.0),
//               child: Text('VAYU-SAMPARC'),
//             ),
//           ],
//         ),
//       ),
//
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: chewieController != null &&
//                   chewieController!.videoPlayerController.value.isInitialized
//                   ? Chewie(controller: chewieController!)
//                   : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 20,),
//                   Text("Loading",style: TextStyle(color: Colors.white),)
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
