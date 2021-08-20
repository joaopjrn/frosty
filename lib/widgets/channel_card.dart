import 'package:flutter/material.dart';
import 'package:frosty/models/channel.dart';

/// A card widget that displays a live channel's thumbnail and details.
class ChannelCard extends StatelessWidget {
  final Channel channelInfo;

  const ChannelCard({Key? key, required this.channelInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.network(
                  channelInfo.thumbnailUrl.replaceFirst('-{width}x{height}', '-1024x576'),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      channelInfo.userName,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(channelInfo.title),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      channelInfo.gameName,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${channelInfo.viewerCount} viewers',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}