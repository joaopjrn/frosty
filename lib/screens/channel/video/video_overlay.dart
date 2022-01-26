import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frosty/constants/constants.dart';
import 'package:frosty/screens/channel/stores/video_store.dart';
import 'package:frosty/screens/settings/settings.dart';
import 'package:intl/intl.dart';

class VideoOverlay extends StatelessWidget {
  final VideoStore videoStore;

  const VideoOverlay({Key? key, required this.videoStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    final backButton = Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        tooltip: 'Back',
        icon: Icon(
          Icons.adaptive.arrow_back,
          color: Colors.white,
        ),
        onPressed: Navigator.of(context).pop,
      ),
    );

    final settingsButton = Align(
      alignment: Alignment.topRight,
      child: IconButton(
        tooltip: 'Settings',
        icon: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
        onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Settings(settingsStore: videoStore.settingsStore),
          ),
        ),
      ),
    );

    final refreshButton = IconButton(
      tooltip: 'Refresh',
      icon: const Icon(
        Icons.refresh,
        color: Colors.white,
      ),
      onPressed: videoStore.handleRefresh,
    );

    final fullScreenButton = IconButton(
      tooltip: videoStore.settingsStore.fullScreen ? 'Exit Fullscreen' : 'Enter Fullscreen',
      icon: videoStore.settingsStore.fullScreen
          ? const Icon(
              Icons.fullscreen_exit,
              color: Colors.white,
            )
          : const Icon(
              Icons.fullscreen,
              color: Colors.white,
            ),
      onPressed: () => videoStore.settingsStore.fullScreen = !videoStore.settingsStore.fullScreen,
    );

    final streamInfo = videoStore.streamInfo;

    if (streamInfo == null) {
      return Stack(
        children: [
          backButton,
          settingsButton,
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                refreshButton,
                if (orientation == Orientation.landscape) fullScreenButton,
              ],
            ),
          ),
        ],
      );
    }

    final streamer = Text(
      regexEnglish.hasMatch(streamInfo.userName) ? streamInfo.userName : streamInfo.userName + ' (${streamInfo.userLogin})',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );

    return Observer(
      builder: (context) => Stack(
        children: [
          backButton,
          settingsButton,
          // Add a play button when paused for Android
          // When an ad is paused on Android there is no way to unpause, so a play button is necessary.
          if (Platform.isAndroid)
            Center(
              child: IconButton(
                tooltip: videoStore.paused ? 'Play' : 'Pause',
                iconSize: 50.0,
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
            )
          else if (!videoStore.paused)
            Center(
              child: IconButton(
                tooltip: 'Pause',
                iconSize: 50.0,
                icon: const Icon(
                  Icons.pause,
                  color: Colors.white,
                ),
                onPressed: videoStore.handlePausePlay,
              ),
            ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: videoStore.handleExpand,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: videoStore.settingsStore.expandInfo
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                streamer,
                                const SizedBox(height: 5.0),
                                Tooltip(
                                  message: videoStore.streamInfo!.title,
                                  preferBelow: false,
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    videoStore.streamInfo!.title,
                                    maxLines: orientation == Orientation.portrait ? 1 : 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  '${videoStore.streamInfo?.gameName} for ${NumberFormat().format(videoStore.streamInfo?.viewerCount)} viewers',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          : streamer,
                    ),
                  ),
                ),
                refreshButton,
                if (Platform.isIOS && videoStore.settingsStore.pictureInPicture)
                  IconButton(
                    tooltip: 'Picture-in-Picture',
                    icon: const Icon(
                      Icons.picture_in_picture_alt_rounded,
                      color: Colors.white,
                    ),
                    onPressed: videoStore.requestPictureInPicture,
                  ),
                if (orientation == Orientation.landscape) fullScreenButton
              ],
            ),
          )
        ],
      ),
    );
  }
}
