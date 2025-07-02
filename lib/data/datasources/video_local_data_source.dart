import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/video_model.dart';
import '../../core/enums/video_source.dart';
import '../../core/errors/exceptions.dart';

abstract class VideoLocalDataSource {
  Future<void> cacheVideos(List<VideoModel> videos, VideoSource source, int page);
  Future<List<VideoModel>> getCachedVideos(VideoSource source, int page);
  Future<void> cacheVideoDetail(VideoDetailModel videoDetail);
  Future<VideoDetailModel?> getCachedVideoDetail(String videoId);
  Future<void> clearCache();
}

class VideoLocalDataSourceImpl implements VideoLocalDataSource {
  final SharedPreferences sharedPreferences;
  
  VideoLocalDataSourceImpl(this.sharedPreferences);
  
  static const String _videoListPrefix = 'video_list_';
  static const String _videoDetailPrefix = 'video_detail_';
  static const Duration _cacheExpiry = Duration(hours: 1);
  
  @override
  Future<void> cacheVideos(List<VideoModel> videos, VideoSource source, int page) async {
    try {
      final key = '${_videoListPrefix}${source.name}_$page';
      final cacheData = {
        'data': videos.map((v) => v.toJson()).toList(),
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      
      await sharedPreferences.setString(key, jsonEncode(cacheData));
    } catch (e) {
      throw CacheException('Failed to cache videos: $e');
    }
  }
  
  @override
  Future<List<VideoModel>> getCachedVideos(VideoSource source, int page) async {
    try {
      final key = '${_videoListPrefix}${source.name}_$page';
      final cachedData = sharedPreferences.getString(key);
      
      if (cachedData == null) {
        throw const CacheException('No cached data found');
      }
      
      final decodedData = jsonDecode(cachedData) as Map<String, dynamic>;
      final timestamp = decodedData['timestamp'] as int;
      final cachedTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      
      // 檢查快取是否過期
      if (DateTime.now().difference(cachedTime) > _cacheExpiry) {
        throw const CacheException('Cache expired');
      }
      
      final videosJson = decodedData['data'] as List<dynamic>;
      return videosJson
          .map((json) => VideoModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw CacheException('Failed to get cached videos: $e');
    }
  }
  
  @override
  Future<void> cacheVideoDetail(VideoDetailModel videoDetail) async {
    try {
      final key = '$_videoDetailPrefix${videoDetail.video.id}';
      final cacheData = {
        'data': videoDetail.toJson(),
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      
      await sharedPreferences.setString(key, jsonEncode(cacheData));
    } catch (e) {
      throw CacheException('Failed to cache video detail: $e');
    }
  }
  
  @override
  Future<VideoDetailModel?> getCachedVideoDetail(String videoId) async {
    try {
      final key = '$_videoDetailPrefix$videoId';
      final cachedData = sharedPreferences.getString(key);
      
      if (cachedData == null) {
        return null;
      }
      
      final decodedData = jsonDecode(cachedData) as Map<String, dynamic>;
      final timestamp = decodedData['timestamp'] as int;
      final cachedTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      
      // 檢查快取是否過期
      if (DateTime.now().difference(cachedTime) > _cacheExpiry) {
        return null;
      }
      
      final detailJson = decodedData['data'] as Map<String, dynamic>;
      return VideoDetailModel.fromJson(detailJson);
    } catch (e) {
      throw CacheException('Failed to get cached video detail: $e');
    }
  }
  
  @override
  Future<void> clearCache() async {
    try {
      final keys = sharedPreferences.getKeys();
      final cacheKeys = keys.where((key) => 
        key.startsWith(_videoListPrefix) || key.startsWith(_videoDetailPrefix)
      );
      
      for (final key in cacheKeys) {
        await sharedPreferences.remove(key);
      }
    } catch (e) {
      throw CacheException('Failed to clear cache: $e');
    }
  }
} 