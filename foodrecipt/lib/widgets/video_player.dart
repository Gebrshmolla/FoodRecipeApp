import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  final String path;
  const VideoApp({super.key, this.path = ''});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  final List<double> _playbackRates = [0.5, 1.0, 1.5, 2.0];
  double _currentPlaybackRate = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.path)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void _stopVideo() {
    setState(() {
      _controller.pause();
      _controller.seekTo(Duration.zero);
    });
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
        _controller.setPlaybackSpeed(_currentPlaybackRate);
      }
    });
  }

  void _changeSpeed(double speed) {
    setState(() {
      _currentPlaybackRate = speed;
      if (_controller.value.isPlaying) {
        _controller.setPlaybackSpeed(_currentPlaybackRate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: _stopVideo,
                  iconSize: 36,
                ),
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                  onPressed: _togglePlayPause,
                  iconSize: 36,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('Speed: ${_currentPlaybackRate}x'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  _playbackRates.map((rate) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        label: Text('${rate}x'),
                        selected: _currentPlaybackRate == rate,
                        onSelected: (selected) {
                          if (selected) {
                            _changeSpeed(rate);
                          }
                        },
                      ),
                    );
                  }).toList(),
            ),
          ],
        )
        : const Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
