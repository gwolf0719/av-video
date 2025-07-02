enum VideoFormat {
  mp4,
  hls,
  m3u8,
  dash,
  unknown;
  
  static VideoFormat fromUrl(String url) {
    final lowercaseUrl = url.toLowerCase();
    
    if (lowercaseUrl.contains('.m3u8')) {
      return VideoFormat.m3u8;
    } else if (lowercaseUrl.contains('.mpd')) {
      return VideoFormat.dash;
    } else if (lowercaseUrl.contains('.mp4')) {
      return VideoFormat.mp4;
    } else if (lowercaseUrl.contains('hls')) {
      return VideoFormat.hls;
    }
    
    return VideoFormat.unknown;
  }
  
  String get extension {
    switch (this) {
      case VideoFormat.mp4:
        return '.mp4';
      case VideoFormat.hls:
      case VideoFormat.m3u8:
        return '.m3u8';
      case VideoFormat.dash:
        return '.mpd';
      case VideoFormat.unknown:
        return '';
    }
  }
  
  bool get isStreamingFormat {
    switch (this) {
      case VideoFormat.hls:
      case VideoFormat.m3u8:
      case VideoFormat.dash:
        return true;
      default:
        return false;
    }
  }
} 