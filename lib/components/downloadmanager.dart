import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DownloadManager {
  static const String _key = 'downloaded_videos';

  static Future<void> addDownloadedVideo(Map<String, String> video) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> downloadedVideos = prefs.getStringList(_key) ?? [];
    downloadedVideos.add(json.encode(video));
    await prefs.setStringList(_key, downloadedVideos);
  }

  static Future<List<Map<String, String>>> getDownloadedVideos() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> downloadedVideos = prefs.getStringList(_key) ?? [];
    return downloadedVideos
        .map((video) => Map<String, String>.from(json.decode(video)))
        .toList();
  }

  static Future<void> removeDownloadedVideo(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> downloadedVideos = prefs.getStringList(_key) ?? [];
    if (index >= 0 && index < downloadedVideos.length) {
      downloadedVideos.removeAt(index);
      await prefs.setStringList(_key, downloadedVideos);
    }
  }
}
