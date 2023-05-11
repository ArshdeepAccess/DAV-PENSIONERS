
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
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
        'https://iafpensioners.gov.in/i/VIDEO/FCB.mp4');
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

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoPlayerScreen extends StatefulWidget {
//   final String videoUrl;
//   VideoPlayerScreen({required this.videoUrl});
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   bool _isFullScreen = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
//
//   void _toggleFullScreen() {
//     setState(() {
//       _isFullScreen = !_isFullScreen;
//       if (_isFullScreen) {
//         SystemChrome.setPreferredOrientations([
//           DeviceOrientation.landscapeLeft,
//           DeviceOrientation.landscapeRight,
//         ]);
//       } else {
//         SystemChrome.setPreferredOrientations([
//           DeviceOrientation.portraitUp,
//           DeviceOrientation.portraitDown,
//         ]);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     return WillPopScope(
//         onWillPop: () async {
//           if (_isFullScreen) {
//             setState(() {
//               _isFullScreen = false;
//               SystemChrome.setPreferredOrientations([
//                 DeviceOrientation.portraitUp,
//                 DeviceOrientation.portraitDown,
//               ]);
//             });
//             return false;
//           } else {
//             return true;
//           }
//         },
//         child: Scaffold(
//           backgroundColor: Colors.black,
//           body: Stack(
//             children: [
//               Center(
//                 child: _controller.value.isInitialized
//                     ? AspectRatio(
//                         aspectRatio: _controller.value.aspectRatio,
//                         child: VideoPlayer(_controller),
//                       )
//                     : Container(),
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Column(
//                   children: [
//                     VideoProgressIndicator(
//                       _controller,
//                       allowScrubbing: true,
//                       colors: VideoProgressColors(
//                         playedColor: Colors.white,
//                         bufferedColor: Colors.white.withOpacity(0.5),
//                         backgroundColor: Colors.grey,
//                       ),
//                     ),
//                     Row(
//                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             setState(() {
//                               final Duration position =
//                                   _controller.value.position;
//                               _controller.seekTo(
//                                   position - const Duration(seconds: 10));
//                             });
//                           },
//                           icon: const Icon(
//                             Icons.replay_10_rounded,
//                             color: Colors.white,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             setState(() {
//                               if (_controller.value.isPlaying) {
//                                 _controller.pause();
//                               } else {
//                                 _controller.play();
//                               }
//                             });
//                           },
//                           icon: Icon(
//                             _controller.value.isPlaying
//                                 ? Icons.pause
//                                 : Icons.play_arrow_rounded,
//                             color: Colors.white,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             setState(() {
//                               final Duration position =
//                                   _controller.value.position;
//                               _controller.seekTo(
//                                   position + const Duration(seconds: 10));
//                             });
//                           },
//                           icon: const Icon(
//                             Icons.forward_10_rounded,
//                             color: Colors.pink,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: _toggleFullScreen,
//                           icon: Icon(
//                             _isFullScreen
//                                 ? Icons.fullscreen_exit
//                                 : Icons.fullscreen_rounded,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               if (_isFullScreen)
//                 Positioned(
//                   top: 0,
//                   left: 0,
//                   right: 0,
//                   bottom: 0,
//                   child: Center(
//                     child: AspectRatio(
//                         aspectRatio: _controller.value.aspectRatio,
//                         child: VideoPlayer(_controller)),
//                   ),
//                 ),
//             ],
//           ),
//         ));
//   }
// }

// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoApp extends StatefulWidget {
//   const VideoApp({Key? key}) : super(key: key);
//
//   @override
//   State<VideoApp> createState() => _VideoAppState();
// }
//
// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController controller;
//   ChewieController? chewieController;
//
//   Future<void> loadVideoPlayer() async {
//     controller = VideoPlayerController.network(
//         'https://iafpensioners.gov.in/i/VIDEO/FCB.mp4');
//
//     await Future.wait([controller.initialize()]);
//
//     chewieController = ChewieController(
//       videoPlayerController: controller,
//       fullScreenByDefault: true,
//       autoPlay: false,
//       looping: false,
//       materialProgressColors: ChewieProgressColors(
//         playedColor: Colors.red,
//         handleColor: Colors.red,
//         backgroundColor: Colors.grey,
//         bufferedColor: Colors.white,
//       ),
//     );
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     loadVideoPlayer();
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
//       appBar: AppBar(
//         backgroundColor: Color(0xFFd3eaf2),
//         title: Row(
//           children: [
//             Image(
//               image: AssetImage(
//                 "assets/images/dav-new-logo.png",
//               ),
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
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Column(
//             children: [
//               Expanded(
//                 child: Center(
//                   child: chewieController != null &&
//                       chewieController!
//                           .videoPlayerController.value.isInitialized
//                       ? SizedBox(
//                     width: double.infinity,
//                     height: double.infinity,
//                     child: Stack(
//                       children: [
//                         Chewie(
//                           controller: chewieController!,
//                         ),
//                         Positioned(
//                           left: 0,
//                           right: 0,
//                           bottom: 0,
//                           child: Visibility(
//                             visible: !chewieController!.isFullScreen,
//                             child: Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment.center,
//                               children: [
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.replay_10,
//                                     color: Colors.white,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       controller.seekTo(Duration(
//                                         seconds: controller
//                                             .value.position
//                                             .inSeconds -
//                                             10,
//                                       ));
//                                     });
//                                   },
//                                 ),
//                                 SizedBox(width: 20),
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.forward_10,
//                                     color: Colors.white,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       controller.seekTo(Duration(
//                                         seconds: controller
//                                             .value.position
//                                             .inSeconds +
//                                             10,
//                                       ));
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                       : Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircularProgressIndicator(),
//                       SizedBox(height: 20),
//                       Text(
//                         "Loading",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//
//   }
// }

// import 'package:chewie/chewie.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoApp extends StatefulWidget {
//   const VideoApp({Key? key}) : super(key: key);
//
//   @override
//   State<VideoApp> createState() => _VideoAppState();
// }
//
// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController controller;
//   ChewieController? chewieController;
//
//   Future<void> loadVideoPlayer() async {
//     controller = VideoPlayerController.network(
//         'https://iafpensioners.gov.in/i/VIDEO/FCB.mp4');
//
//     await Future.wait([controller.initialize()]);
//
//     chewieController = ChewieController(
//       videoPlayerController: controller,
//       fullScreenByDefault: true,
//       autoPlay: false,
//       looping: false,
//     );
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     loadVideoPlayer();
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
//       appBar: AppBar(
//         backgroundColor: Color(0xFFd3eaf2),
//         title: Row(
//           children: [
//             Image(
//               image: AssetImage(
//                 "assets/images/dav-new-logo.png",
//               ),
//               fit: BoxFit.contain,
//               height: 60,
//             ),
//             Container(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('VAYU-SAMPARC')),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: chewieController != null &&
//                   chewieController!
//                       .videoPlayerController.value.isInitialized
//                   ? Stack(
//                 children: [
//                   Chewie(
//                     controller: chewieController!,
//                     cupertinoProgressColors: ChewieProgressColors(
//                       playedColor: CupertinoColors.systemRed,
//                       handleColor: CupertinoColors.systemRed,
//                       backgroundColor: CupertinoColors.systemGrey,
//                       bufferedColor: CupertinoColors.white,
//                     ),
//                   ),
//                   Positioned(
//                     left: 0,
//                     right: 0,
//                     bottom: 0,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.replay_10, color: Colors.white),
//                           onPressed: () {
//                             setState(() {
//                               controller.seekTo(Duration(
//                                   seconds: controller.value.position.inSeconds - 10));
//                             });
//                           },
//                         ),
//                         SizedBox(width: 20),
//                         IconButton(
//                           icon: Icon(Icons.forward_10, color: Colors.white),
//                           onPressed: () {
//                             setState(() {
//                               controller.seekTo(Duration(
//                                   seconds: controller.value.position.inSeconds + 10));
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               )
//                   : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "Loading",
//                     style: TextStyle(color: Colors.white),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
