import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frosty/screens/settings.dart';
import 'package:frosty/stores/settings_store.dart';
import 'package:frosty/stores/video_store.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Video extends StatelessWidget {
  final String channelName;
  final VideoStore videoStore;
  final SettingsStore settingsStore;

  const Video({
    Key? key,
    required this.channelName,
    required this.videoStore,
    required this.settingsStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: 'https://player.twitch.tv/?channel=$channelName&muted=false&parent=frosty',
          javascriptMode: JavascriptMode.unrestricted,
          allowsInlineMediaPlayback: true,
          initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
          onWebViewCreated: (controller) {
            videoStore.controller = controller;
          },
          onPageFinished: (string) {
            videoStore.removeOverlay();
          },
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: SizedBox.expand(
            child: Observer(
              builder: (_) {
                return AnimatedOpacity(
                  opacity: videoStore.menuVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 100),
                  child: ColoredBox(
                    color: Colors.black.withOpacity(0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Settings(settingsStore: settingsStore);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        IconButton(
                          icon: videoStore.paused
                              ? const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.pause,
                                  color: Colors.white,
                                ),
                          onPressed: videoStore.handlePausePlay,
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.fullscreen,
                                color: Colors.white,
                              ),
                              onPressed: videoStore.requestFullscreen,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          onTap: videoStore.handleVideoTap,
        ),
      ],
    );
  }
}
