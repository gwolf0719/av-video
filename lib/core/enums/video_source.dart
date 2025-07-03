import 'package:flutter/material.dart';

// 影片來源配置類別
class VideoSourceConfig {
  final String id;
  final String displayName;
  final String baseUrl;
  final IconData icon;
  final bool requiresAgeVerification;
  final Color? primaryColor;
  final String description;

  const VideoSourceConfig({
    required this.id,
    required this.displayName,
    required this.baseUrl,
    required this.icon,
    this.requiresAgeVerification = false,
    this.primaryColor,
    required this.description,
  });
}

enum VideoSource {
  anime,
  limit1;
  // 要新增影片來源，只需：
  // 1. 在這裡添加新的 enum 值：japanese, western, etc.
  // 2. 在下面的 _configs 中添加對應配置
  // 其他檔案完全不用修改！
  
  // 集中配置所有影片來源的資訊
  static const Map<VideoSource, VideoSourceConfig> _configs = {
    VideoSource.anime: VideoSourceConfig(
      id: 'anime',
      displayName: '動畫專區',
      baseUrl: 'https://18av.mm-cg.com/zh/CensoredAnimation_list/all/',
      icon: Icons.animation,
      primaryColor: Colors.blue,
      description: '動畫影片內容',
    ),
    VideoSource.limit1: VideoSourceConfig(
      id: 'limit1',
      displayName: '中文字幕',
      baseUrl: 'https://18av.mm-cg.com/zh/content_news/all/',
      icon: Icons.subtitles,
      primaryColor: Colors.orange,
      description: 'LIMIT1 中文字幕內容',
      requiresAgeVerification: true,
    ),
    
    // 要新增影片來源，只需在此添加新配置：
    // VideoSource.japanese: VideoSourceConfig(
    //   id: 'japanese',
    //   displayName: '日語原版',
    //   baseUrl: 'https://example.com/japanese/',
    //   icon: Icons.language,
    //   primaryColor: Colors.red,
    //   description: '日語原版影片',
    //   requiresAgeVerification: true,
    // ),
    // VideoSource.western: VideoSourceConfig(
    //   id: 'western',
    //   displayName: '歐美影片',
    //   baseUrl: 'https://example.com/western/',
    //   icon: Icons.movie,
    //   primaryColor: Colors.green,
    //   description: '歐美影片內容',
    // ),
  };

  // 獲取配置
  VideoSourceConfig get config => _configs[this]!;
  
  // 便捷存取屬性
  String get displayName => config.displayName;
  String get baseUrl => config.baseUrl;
  IconData get icon => config.icon;
  bool get requiresAgeVerification => config.requiresAgeVerification;
  Color? get primaryColor => config.primaryColor;
  String get description => config.description;
  String get id => config.id;

  // 靜態方法：獲取所有配置
  static List<VideoSourceConfig> get allConfigs => 
      VideoSource.values.map((source) => source.config).toList();
  
  // 靜態方法：根據ID查找VideoSource
  static VideoSource? fromId(String id) {
    for (final source in VideoSource.values) {
      if (source.id == id) return source;
    }
    return null;
  }
  
  // 靜態方法：獲取預設來源
  static VideoSource get defaultSource => VideoSource.anime;
} 