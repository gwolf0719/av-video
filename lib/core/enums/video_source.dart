enum VideoSource {
  anime,
  limit1,
  chinese1;
  
  String get displayName {
    switch (this) {
      case VideoSource.anime:
        return '動畫';
      case VideoSource.limit1:
        return 'LIMIT1->中文字幕';
      case VideoSource.chinese1:
        return '中文1->中文字幕';
    }
  }
  
  String get baseUrl {
    switch (this) {
      case VideoSource.anime:
        return 'https://18av.mm-cg.com/zh/CensoredAnimation_list/all/';
      case VideoSource.limit1:
        return 'https://18av.mm-cg.com/zh/content_news/all/';
      case VideoSource.chinese1:
        return 'https://chinese1.example.com';
    }
  }
  
  bool get requiresAgeVerification {
    switch (this) {
      case VideoSource.limit1:
        return true;
      default:
        return false;
    }
  }
} 