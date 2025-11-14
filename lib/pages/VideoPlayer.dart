import 'dart:io';

import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:video_player/video_player.dart';


class VideoPlayerMain extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerMain({super.key, required this.videoUrl});

  @override
  State<VideoPlayerMain> createState() => _VideoPlayerMainState();
}

class _VideoPlayerMainState extends State<VideoPlayerMain> {
  late VideoPlayerController _controller;
  final ValueNotifier<bool> _isInitialized = ValueNotifier(false);
  final ValueNotifier<bool> _isPlaying = ValueNotifier(false);
  final ValueNotifier<bool> _hasError = ValueNotifier(false);
  final ValueNotifier<bool> _showControls = ValueNotifier(false);
  late ValueNotifier<Duration> _positionNotifier;

  @override
  void initState() {
    super.initState();
    _positionNotifier = ValueNotifier(Duration.zero);
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize()
          .then((_) {
        if (mounted) {
          _isInitialized.value = true;
          _controller.play();
          _isPlaying.value = true;
        }
      })
          .catchError((e) {
        debugPrint("❌ init failed: $e");
        _hasError.value = true;
      });

    _controller.addListener(() {
      if (_controller.value.hasError) _hasError.value = true;
      _isPlaying.value = _controller.value.isPlaying;
      _positionNotifier.value = _controller.value.position;
    });
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  void _toggleControls() {
    // Show controls on tap
    _showControls.value = true;
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _controller.value.isPlaying) {
        _showControls.value = false; // Hide after 3s
      }
    });
  }

  void _seekForward() {
    final current = _controller.value.position;
    final duration = _controller.value.duration;
    _controller.seekTo(
      current + const Duration(seconds: 10) < duration
          ? current + const Duration(seconds: 10)
          : duration,
    );
    _toggleControls(); // reset timer
  }

  void _seekBackward() {
    final current = _controller.value.position;
    _controller.seekTo(
      current - const Duration(seconds: 10) > Duration.zero
          ? current - const Duration(seconds: 10)
          : Duration.zero,
    );
    _toggleControls(); // reset timer
  }

  void _enterFullscreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            FullScreenNewsVideoPlayer(videoUrl: widget.videoUrl),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _isInitialized.dispose();
    _isPlaying.dispose();
    _hasError.dispose();
    _showControls.dispose();
    _positionNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _hasError,
      builder: (_, hasError, __) {
        if (hasError) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, color: Colors.redAccent, size: 40),
                SizedBox(height: 8),
                Text(
                  "Failed to load video",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ],
            ),
          );
        }

        return ValueListenableBuilder<bool>(
          valueListenable: _isInitialized,
          builder: (_, initialized, __) {
            if (!initialized) {
             // return spinkits.getSpinningLinespinkit();
            }

            return GestureDetector(
              onTap: () {
                _togglePlayPause();
                _toggleControls();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_controller),
                  ValueListenableBuilder<bool>(
                    valueListenable: _isPlaying,
                    builder: (_, playing, __) {
                      return !playing
                          ? const Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 40,
                      )
                          : const SizedBox.shrink();
                    },
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: _showControls,
                    builder: (_, show, __) {
                      if (!show) return const SizedBox.shrink();
                      return Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 16),
                            _overlayButton(Icons.replay_10, _seekBackward),
                            const Spacer(),
                            _overlayButton(Icons.forward_10, _seekForward),
                            const SizedBox(width: 16),
                          ],
                        ),
                      );
                    },
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: _showControls,
                    builder: (_, show, __) {
                      if (!show) return const SizedBox.shrink();

                      return Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black45.withOpacity(0.4),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ValueListenableBuilder<Duration>(
                                valueListenable: _positionNotifier,
                                builder: (_, position, __) {
                                  final duration = _controller.value.duration;
                                  return Row(
                                    children: [
                                      Text(
                                        _formatDuration(position),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Expanded(
                                        child: SliderTheme(
                                          data: SliderThemeData(
                                            thumbShape:
                                            const RoundSliderThumbShape(
                                              enabledThumbRadius: 6,
                                            ),
                                            trackHeight: 2.5,
                                            thumbColor: Colors.white,
                                            activeTrackColor: Colors.redAccent,
                                            inactiveTrackColor: Colors.white
                                                .withOpacity(0.4),
                                          ),
                                          child: Slider(
                                            min: 0,
                                            max: duration.inMilliseconds
                                                .toDouble(),
                                            value: position.inMilliseconds
                                                .clamp(
                                              0,
                                              duration.inMilliseconds,
                                            )
                                                .toDouble(),
                                            onChanged: (v) {
                                              _controller.seekTo(
                                                Duration(
                                                  milliseconds: v.toInt(),
                                                ),
                                              );
                                              _toggleControls(); // reset timer
                                            },
                                          ),
                                        ),
                                      ),
                                      Text(
                                        _formatDuration(duration),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.fullscreen,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        onPressed: _enterFullscreen,
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  Widget _overlayButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black38,
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: Colors.white, size: 38),
      ),
    );
  }
}

class FullScreenNewsVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const FullScreenNewsVideoPlayer({super.key, required this.videoUrl});

  @override
  State<FullScreenNewsVideoPlayer> createState() =>
      _FullScreenNewsVideoPlayerState();
}

class _FullScreenNewsVideoPlayerState extends State<FullScreenNewsVideoPlayer> {
  late VideoPlayerController _controller;
  final ValueNotifier<bool> _isInitialized = ValueNotifier(false);
  final ValueNotifier<bool> _isPlaying = ValueNotifier(false);
  final ValueNotifier<bool> _hasError = ValueNotifier(false);
  final ValueNotifier<bool> _showControls = ValueNotifier(false);
  late ValueNotifier<Duration> _positionNotifier;

  @override
  void initState() {
    super.initState();
    _positionNotifier = ValueNotifier(Duration.zero);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize()
          .then((_) {
        if (mounted) {
          _isInitialized.value = true;
          _controller.play();
          _isPlaying.value = true;
        }
      })
          .catchError((e) {
        debugPrint("❌ Fullscreen init failed: $e");
        _hasError.value = true;
      });

    _controller.addListener(() {
      if (_controller.value.hasError) {
        _hasError.value = true;
      }
      _isPlaying.value = _controller.value.isPlaying;
      _positionNotifier.value = _controller.value.position;
    });
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  void _toggleControls() {
    // Show controls on tap
    _showControls.value = true;
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _controller.value.isPlaying) {
        _showControls.value = false; // Hide after 3s
      }
    });
  }

  void _seekForward() {
    final current = _controller.value.position;
    final duration = _controller.value.duration;
    _controller.seekTo(
      current + const Duration(seconds: 10) < duration
          ? current + const Duration(seconds: 10)
          : duration,
    );
    _toggleControls(); // reset timer
  }

  void _seekBackward() {
    final current = _controller.value.position;
    _controller.seekTo(
      current - const Duration(seconds: 10) > Duration.zero
          ? current - const Duration(seconds: 10)
          : Duration.zero,
    );
    _toggleControls(); // reset timer
  }

  void _exitFullscreen() {
    // Restore orientation and system UI
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    _isInitialized.dispose();
    _isPlaying.dispose();
    _hasError.dispose();
    _showControls.dispose();
    _positionNotifier.dispose();
    // Restore orientation and system UI
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ValueListenableBuilder<bool>(
        valueListenable: _hasError,
        builder: (_, hasError, __) {
          if (hasError) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, color: Colors.redAccent, size: 40),
                  SizedBox(height: 8),
                  Text(
                    "Failed to load video",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ],
              ),
            );
          }

          return ValueListenableBuilder<bool>(
            valueListenable: _isInitialized,
            builder: (_, initialized, __) {
              if (!initialized) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }

              return GestureDetector(
                onTap: () {
                  _togglePlayPause();
                  _toggleControls();
                },
                child: Stack(
                  fit: StackFit.expand, // 👈 Full fit
                  children: [
                    Center(
                      child: FittedBox(
                        // 👈 Ensure complete fit
                        fit: BoxFit.contain,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    ),

                    // 🎮 Center Play/Pause Overlay
                    ValueListenableBuilder<bool>(
                      valueListenable: _isPlaying,
                      builder: (_, playing, __) {
                        return !playing
                            ? const Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 64,
                        )
                            : const SizedBox.shrink();
                      },
                    ),

                    // 👈 Top left exit button when controls show
                    ValueListenableBuilder<bool>(
                      valueListenable: _showControls,
                      builder: (_, show, __) {
                        if (!show) return const SizedBox.shrink();
                        return Positioned(
                          top: 40,
                          left: 20,
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: _exitFullscreen,
                          ),
                        );
                      },
                    ),

                    // 👈 Seek buttons row when controls show
                    ValueListenableBuilder<bool>(
                      valueListenable: _showControls,
                      builder: (_, show, __) {
                        if (!show) return const SizedBox.shrink();
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 16),
                            _overlayButton(Icons.replay_10, _seekBackward),
                            const Spacer(),
                            _overlayButton(Icons.forward_10, _seekForward),
                            const SizedBox(width: 16),
                          ],
                        );
                      },
                    ),

                    // 👈 Bottom progress bar when controls show
                    ValueListenableBuilder<bool>(
                      valueListenable: _showControls,
                      builder: (_, show, __) {
                        if (!show) return const SizedBox.shrink();

                        return Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black45.withOpacity(0.4),
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ValueListenableBuilder<Duration>(
                                  valueListenable: _positionNotifier,
                                  builder: (_, position, __) {
                                    final duration = _controller.value.duration;
                                    return Row(
                                      children: [
                                        Text(
                                          _formatDuration(position),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Expanded(
                                          child: SliderTheme(
                                            data: SliderThemeData(
                                              thumbShape:
                                              const RoundSliderThumbShape(
                                                enabledThumbRadius: 6,
                                              ),
                                              trackHeight: 2.5,
                                              thumbColor: Colors.white,
                                              activeTrackColor:
                                              Colors.redAccent,
                                              inactiveTrackColor: Colors.white
                                                  .withOpacity(0.4),
                                            ),
                                            child: Slider(
                                              min: 0,
                                              max: duration.inMilliseconds
                                                  .toDouble(),
                                              value: position.inMilliseconds
                                                  .clamp(
                                                0,
                                                duration.inMilliseconds,
                                              )
                                                  .toDouble(),
                                              onChanged: (v) {
                                                _controller.seekTo(
                                                  Duration(
                                                    milliseconds: v.toInt(),
                                                  ),
                                                );
                                                _toggleControls(); // reset timer
                                              },
                                            ),
                                          ),
                                        ),
                                        Text(
                                          _formatDuration(duration),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  Widget _overlayButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black38,
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: Colors.white, size: 38),
      ),
    );
  }
}

