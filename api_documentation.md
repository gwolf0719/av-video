# AVTV API 技術文件 - 三個核心內容來源詳解

## 目錄
1. [整體架構](#整體架構)
2. [動畫頁籤 API](#動畫頁籤-api)
3. [LIMIT1 中文字幕伺服器](#limit1-中文字幕伺服器)
4. [中文1 中文字幕伺服器](#中文1-中文字幕伺服器)
5. [播放器適配系統](#播放器適配系統)
6. [安全與加密機制](#安全與加密機制)

---

## 整體架構

### API 路由分發系統
應用使用 `com.iwantavnow.android.a.java` 作為核心 API 處理器，主要方法：

```java
// 主要 API 分發器
public static JSONObject a(Context context, JSONObject jSONObject, int i)

// 播放器解析
public static JSONObject a(Context context, JSONObject jSONObject)
```

### 伺服器配置架構
在 `f.java` 中的 `ay` 變數（JSONArray）存儲所有伺服器配置：

| 索引 | 類型 | 對應方法 | 內容來源 |
|------|------|----------|----------|
| 0-2  | 主要內容 | `p()` | VR/360 影片 |
| 3-5  | 動畫內容 | `o()` | **動畫頁籤** |
| 6-8  | 中文字幕 | `n()` | **中文1->中文字幕** |
| 9-11 | 影片內容 | `m()` | LIMIT1 等其他影片 |
| 12-14| 漫畫內容 | `q()` | 漫畫頁籤 |

---

## 動畫頁籤 API

### 基本配置
**方法位置**: `f.java` 第 885-891 行 `o()` 方法

**JSON 結構**:
```json
{
  "server_name": "動畫",
  "from": "animation",
  "type": "1",
  "channels": [
    {
      "name": "最新動畫",
      "type": "1", 
      "channel": "all"
    },
    {
      "name": "分類瀏覽",
      "type": "2",
      "channel": "category_list"
    }
  ]
}
```

### API 端點分析

#### 1. 列表 API (方法: `t()`)
**位置**: `a.java` 第 1640 行

**端點格式**:
```
https://18av.mm-cg.com/zh/animation_list/all/{page}.html
```

**實際實現**:
```java
private static JSONObject t(JSONObject jSONObject, int i) {
    String o = o("https://18av.mm-cg.com/zh/animation_list/all/" + i3 + ".html");
    // 解析 HTML，提取動畫列表
    String[] split = o.split("class=\"post ");
    // 處理每個動畫項目
}
```

**回傳格式**:
```json
{
  "data": [
    {
      "title": "動畫標題",
      "image": "縮圖URL",
      "link": "詳細頁面URL",
      "from": "animation",
      "length": ""
    }
  ],
  "result": "success"
}
```

#### 2. 播放器解析 (方法: `a()`)
**位置**: `a.java` 第 1867 行

**處理流程**:
```java
private static JSONObject a(JSONObject jSONObject) {
    // 步驟1: 取得播放頁面內容
    String a2 = a(jSONObject.getString("link"), g(), 
                  "javascript:jfun_show_vfc();", 
                  Arrays.asList(".*imgscloud.com.*.m3u8", ".*imgstream2.com.*.m3u8"));
    
    // 步驟2: 建構播放器回應
    JSONArray jSONArray = new JSONArray();
    jSONArray.put(new JSONObject()
        .put("file", a2)
        .put("name", "HLS")
        .put("type", "hls"));
    
    return response;
}
```

**M3U8 串流處理**:
- 支援 ImgsCloud (`*.imgscloud.com.*.m3u8`)
- 支援 ImgStream2 (`*.imgstream2.com.*.m3u8`)
- 使用 HLS 協議播放

---

## LIMIT1 中文字幕伺服器

### 特殊標識系統
LIMIT1 伺服器專門處理限制級內容，具有特殊的年齡驗證機制。

**識別標記**:
- 伺服器名稱包含 "LIMIT1"
- 內容類型標記為成人級別
- 需要額外的存取驗證

### API 處理邏輯

#### 1. 年齡驗證檢查
```java
// 在播放前檢查年齡驗證狀態
if (serverName.contains("LIMIT1")) {
    // 觸發年齡驗證流程
    if (!hasAgeVerification()) {
        showAgeVerificationDialog();
        return;
    }
}
```

#### 2. 內容過濾機制
**關鍵字過濾**:
- 自動檢測並標記成人內容
- 提供內容分級警告
- 實施存取控制

#### 3. 字幕處理系統
**支援格式**:
- SRT (SubRip)
- VTT (WebVTT)
- ASS/SSA (Advanced SubStation Alpha)

**字幕 API 結構**:
```json
{
  "subtitles": [
    {
      "language": "zh-TW",
      "format": "srt",
      "url": "字幕檔案URL"
    },
    {
      "language": "zh-CN", 
      "format": "vtt",
      "url": "簡體字幕URL"
    }
  ]
}
```

---

## 中文1 中文字幕伺服器

### 基本配置
**方法位置**: `f.java` 第 878-884 行 `n()` 方法

**伺服器類型**: 專門提供中文字幕影片內容

### API 架構分析

#### 1. 內容分類系統
**主要分類**:
- 最新影片 (`type: "1"`)
- 熱門影片 (`type: "2"`) 
- 分類瀏覽 (`type: "3"`)
- 演員分類 (`type: "4"`)
- 製作商分類 (`type: "5"`)
- 搜尋功能 (`type: "search"`)

#### 2. 多播放器支援
**支援的播放器引擎**:

**引擎 A** - 高品質 M3U8:
```java
private static JSONObject a(JSONObject jSONObject) {
    // 處理 ImgsCloud 和 ImgStream2
    List<String> patterns = Arrays.asList(
        ".*imgscloud.com.*.m3u8",
        ".*imgstream2.com.*.m3u8"
    );
}
```

**引擎 B** - 多格式支援:
```java
private static JSONObject b(JSONObject jSONObject) {
    // 支援多種串流格式
    List<String> patterns = Arrays.asList(
        ".*ahvsh.com/e/.*",
        ".*streamhide.to/e/.*", 
        ".*tapewithadblock.org/e/.*",
        ".*streamtape.to/e/.*",
        ".*urlset/master.m3u8.*"
    );
}
```

**引擎 C** - 直播串流:
```java
private static JSONObject c(JSONObject jSONObject) {
    // 處理直播 HLS 串流
    String hlsUrl = html.split("hlsUrl = '")[1].split("'")[0];
    // 建構 HLS 播放清單
}
```

#### 3. 自動故障轉移
```java
// 播放器選擇邏輯
if (Math.random() < 0.5d) {
    // 優先使用 StreamHide
    javascript = "javascript:if(typeof jfun_show_SH === \"function\"){jfun_show_SH();}...";
} else {
    // 備用 StreamTape
    javascript = "javascript:if(typeof jfun_show_ST === \"function\"){jfun_show_ST();}...";
}
```

---

## 播放器適配系統

### 支援的格式與協議

| 格式 | 協議 | 用途 | 對應播放器 |
|------|------|------|------------|
| HLS | M3U8 | 串流播放 | IjkPlayer |
| DASH | MPD | 高品質串流 | ExoPlayer |
| MP4 | HTTP | 直接播放 | 原生播放器 |
| RTMP | RTMP | 直播串流 | IjkPlayer |

### 播放器引擎配置

#### IjkPlayer 設定
```java
// 在 VideoPlayer.java 中
ijkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "mediacodec", 1);
ijkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "opensles", 1);
ijkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_FORMAT, "analyzemaxduration", 100);
```

#### M3U8 下載器整合
```java
// 支援第三方 M3U8 下載器
if (f.a("com.leavjenn.m3u8downloader", context)) {
    Intent intent = packageManager.getLaunchIntentForPackage("com.leavjenn.m3u8downloader");
    intent.setDataAndType(Uri.parse(videoUrl), "video/m3u8");
    startActivity(intent);
}
```

### 字幕同步系統

#### 字幕載入邏輯
```java
// 字幕檔案處理
if (subtitleUrl.endsWith(".srt")) {
    // 處理 SRT 格式
    loadSRTSubtitle(subtitleUrl);
} else if (subtitleUrl.endsWith(".vtt")) {
    // 處理 WebVTT 格式  
    loadVTTSubtitle(subtitleUrl);
}
```

#### 多語言支援
- **繁體中文**: zh-TW
- **簡體中文**: zh-CN  
- **英文**: en
- **日文**: ja

---

## 安全與加密機制

### 網路請求保護

#### SSL/TLS 配置
```java
// 自訂 SSL 信任管理器
public static z.a d() {
    TrustManager[] trustManagers = new TrustManager[] {
        new X509TrustManager() {
            public void checkClientTrusted(X509Certificate[] chain, String authType) {}
            public void checkServerTrusted(X509Certificate[] chain, String authType) {}
            public X509Certificate[] getAcceptedIssuers() { return new X509Certificate[0]; }
        }
    };
}
```

#### 反檢測機制
```java
// User-Agent 偽裝
private static String g() {
    return "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36";
}

// 隨機延遲請求
private static void h() {
    try {
        Thread.sleep((long)(Math.random() * 2000 + 1000));
    } catch (InterruptedException e) {}
}
```

### 內容保護

#### JavaScript 執行環境
```java
// 動態 JavaScript 執行
private static String a(String url, String userAgent, String javascript, 
                       List<String> patterns, String referer, String origin, String cookie) {
    // 在 WebView 中執行 JavaScript 來解密串流 URL
    webView.evaluateJavascript(javascript, new ValueCallback<String>() {
        public void onReceiveValue(String value) {
            // 解析回傳的串流 URL
        }
    });
}
```

#### URL 模式匹配
```java
// 安全的 URL 模式檢查
private static boolean matchesPattern(String url, List<String> patterns) {
    for (String pattern : patterns) {
        if (url.matches(pattern)) {
            return true;
        }
    }
    return false;
}
```

---

## 總結

這三個內容來源代表了 AVTV 應用的核心功能：

1. **動畫頁籤**: 提供成人動畫內容，使用 18av.mm-cg.com 作為數據源
2. **LIMIT1 中文字幕**: 專門的限制級內容伺服器，具有嚴格的年齡驗證
3. **中文1 中文字幕**: 多格式支援的中文字幕影片服務，包含完整的故障轉移機制

每個來源都有獨特的 API 結構、播放器適配方案和安全機制，共同構成了一個功能完整的多媒體內容平台。 