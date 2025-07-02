import 'dart:io';
import 'package:flutter/foundation.dart';

class PlatformUtils {
  static bool get isTV {
    if (kIsWeb) return false;
    
    // Android TV 檢測
    if (Platform.isAndroid) {
      // 在 Android 上，可以通過檢查系統屬性來判斷是否為 TV
      // 這裡先簡單返回 false，實際應用中需要使用 platform_info 或其他方法
      return false; // TODO: 實作 Android TV 檢測邏輯
    }
    
    return false;
  }
  
  static bool get isMobile => Platform.isAndroid || Platform.isIOS;
  
  static bool get isDesktop => Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  
  static bool get supportsRemoteControl => isTV;
  
  static bool get shouldShowBackButton => !isTV;
  
  static double get gridCrossAxisCount {
    if (isTV) return 5.0;
    if (isDesktop) return 4.0;
    return 2.0; // Mobile
  }
} 