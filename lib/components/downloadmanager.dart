class DownloadManager {
  static final List<Map<String, String>> _downloadedVideos = [];

  // Method to add a video to the download list
  static void addDownloadedVideo(Map<String, String> video) {
    _downloadedVideos.add(video);
  }

  // Method to retrieve the list of downloaded videos
  static List<Map<String, String>> getDownloadedVideos() {
    return _downloadedVideos;
  }
}
