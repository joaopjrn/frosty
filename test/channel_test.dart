import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:frosty/models/channel.dart';

void main() {
  test('Twitch channel should parse', () {
    const sampleChannel = '''
      {
        "id":"43809710301",
        "user_id":"71092938",
        "user_login":"xqcow",
        "user_name":"xQcOW",
        "game_id":"508292",
        "game_name":"Bloons TD 6",
        "type":"live",
        "title":"A shorter title...",
        "viewer_count":50051,
        "started_at":"2021-09-23T20:06:22Z",
        "language":"en",
        "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_xqcow-{width}x{height}.jpg",
        "tag_ids":[
          "e6bb8b34-4c28-4b5f-94ed-12c1ebf2d0e4",
          "6ea6bca4-4712-4ab9-a906-e3336a9d8039",
          "6606e54c-f92d-40f6-8257-74977889ccdd"
          ],
        "is_mature":false
      }
    ''';

    final decoded = jsonDecode(sampleChannel);
    final channel = Channel.fromJson(decoded);

    expect(channel.id, '43809710301');
    expect(channel.userId, '71092938');
    expect(channel.userLogin, 'xqcow');
    expect(channel.userName, 'xQcOW');
    expect(channel.gameId, '508292');
    expect(channel.gameName, 'Bloons TD 6');
    expect(channel.type, 'live');
    expect(channel.title, 'A shorter title...');
    expect(channel.viewerCount, 50051);
    expect(channel.startedAt, '2021-09-23T20:06:22Z');
    expect(channel.language, 'en');
    expect(channel.thumbnailUrl, 'https://static-cdn.jtvnw.net/previews-ttv/live_user_xqcow-{width}x{height}.jpg');
    expect(channel.tagIds, ["e6bb8b34-4c28-4b5f-94ed-12c1ebf2d0e4", "6ea6bca4-4712-4ab9-a906-e3336a9d8039", "6606e54c-f92d-40f6-8257-74977889ccdd"]);
    expect(channel.isMature, false);
  });
}
