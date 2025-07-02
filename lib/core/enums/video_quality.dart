enum VideoQuality {
  auto,
  p360,
  p480,
  p720,
  p1080,
  p1440,
  p2160;

  String get displayName {
    switch (this) {
      case VideoQuality.auto:
        return '自動';
      case VideoQuality.p360:
        return '360p';
      case VideoQuality.p480:
        return '480p';
      case VideoQuality.p720:
        return '720p';
      case VideoQuality.p1080:
        return '1080p';
      case VideoQuality.p1440:
        return '1440p';
      case VideoQuality.p2160:
        return '4K';
    }
  }

  int get height {
    switch (this) {
      case VideoQuality.auto:
        return 0;
      case VideoQuality.p360:
        return 360;
      case VideoQuality.p480:
        return 480;
      case VideoQuality.p720:
        return 720;
      case VideoQuality.p1080:
        return 1080;
      case VideoQuality.p1440:
        return 1440;
      case VideoQuality.p2160:
        return 2160;
    }
  }
} 