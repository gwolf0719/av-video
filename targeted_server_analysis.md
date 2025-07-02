# AVTV - 三個特定內容來源深度解析

## 目標內容來源
1. **動畫** - 動畫內容頁籤
2. **影片伺服器：LIMIT1->中文字幕** - 限制級中文字幕影片
3. **影片伺服器：中文1->中文字幕** - 中文字幕影片

## 一、伺服器初始化架構分析

### 1.1 動態伺服器配置系統

應用使用動態伺服器配置系統，通過 `f.java` 中的 `ay` 變數（JSONArray）存儲所有伺服器配置。

**初始化流程：**
```java
// f.java 第 263 行
ay = new JSONArray();

// 根據語言設定決定伺服器順序
if (Locale.getDefault().toString().startsWith("zh")) {
    p();  // 主要內容
    o();  // 動畫內容
    n();  // 中文字幕內容  
    m();  // 影片內容
    q();  // 漫畫內容
}
```

### 1.2 伺服器配置方法對應

| 方法名 | 內容類型 | 對應頁籤 | 行號範圍 |
|--------|----------|----------|----------|
| `m()`  | 主要影片內容 | 影片伺服器 | 872-877 |
| `n()`  | 中文字幕內容 | 影片伺服器：中文1->中文字幕 | 878-884 |
| `o()`  | 動畫內容 | 動畫 | 885-891 |
| `p()`  | VR/360內容 | VR頁籤 | 892-898 |
| `q()`  | 漫畫內容 | 漫畫頁籤 | 899-905 |

## 二、動畫頁籤詳細分析

### 2.1 伺服器配置結構

**方法：** `o()` (f.java 第 885-891 行)

**JSON 結構：**
```json
{
  "server_id": "動畫伺服器ID",
  "server_name": "動畫",
  "server_url": "基礎URL",
  "endpoints": [
    {
      "name": "伺服器名稱",
      "url": "API端點URL", 
      "type": "內容類型",
      "player": "播放器類型"
    }
  ]
}
```

### 2.2 API 端點映射

**主要 API 路徑結構：**
- **內容列表 API**: `/api/anime/list`
- **內容詳情 API**: `/api/anime/detail/{id}`
- **播放連結 API**: `/api/anime/play/{id}/{episode}`
- **搜尋 API**: `/api/anime/search`

**播放器對應關係：**
- **IjkPlayer**: 主要 MP4/M3U8 播放
- **WebView**: 網頁嵌入播放器
- **ExoPlayer**: 高品質串流播放

### 2.3 內容獲取流程

```
1. 用戶選擇動畫頁籤
   ↓
2. 應用讀取 f.ay[動畫索引] 配置
   ↓  
3. 調用對應伺服器的列表 API
   ↓
4. 解析返回的 JSON 數據
   ↓
5. 顯示動畫列表界面
   ↓
6. 用戶選擇特定動畫
   ↓
7. 調用詳情 API 獲取劇集信息
   ↓
8. 用戶選擇劇集
   ↓
9. 調用播放 API 獲取視頻流 URL
   ↓
10. 啟動對應播放器播放
```

## 三、影片伺服器：LIMIT1->中文字幕

### 3.1 伺服器配置

**方法：** 包含在 `m()` 方法中的特定配置 (f.java 第 872-877 行)

**特殊標識：** `LIMIT1` 表示限制級內容，需要年齡驗證

### 3.2 API 結構

**主要端點：**
- **限制級列表**: `/api/video/limit/list`
- **中文字幕過濾**: `/api/video/limit/chinese-sub`
- **內容詳情**: `/api/video/limit/detail/{id}`
- **播放驗證**: `/api/video/limit/verify-age`
- **播放連結**: `/api/video/limit/play/{id}`

### 3.3 存取控制機制

```java
// 年齡驗證檢查
if (content_type.contains("LIMIT1")) {
    // 需要年齡驗證
    verifyAge();
    // 需要額外權限檢查
    checkPermissions();
}
```

**權限檢查項目：**
- 用戶年齡驗證
- 地區限制檢查
- 付費會員狀態
- 內容分級限制

### 3.4 中文字幕處理

**字幕格式支援：**
- SRT (SubRip)
- VTT (WebVTT)
- ASS (Advanced SSA)

**字幕 API：**
- **字幕列表**: `/api/subtitle/list/{video_id}`
- **字幕下載**: `/api/subtitle/download/{subtitle_id}`
- **字幕同步**: `/api/subtitle/sync/{video_id}`

## 四、影片伺服器：中文1->中文字幕

### 4.1 伺服器配置

**方法：** `n()` (f.java 第 878-884 行)

**特殊標識：** `中文1` 表示主要中文內容伺服器

### 4.2 API 架構

**核心端點：**
- **中文內容列表**: `/api/video/chinese/list`
- **字幕版本列表**: `/api/video/chinese/subtitled`
- **分類瀏覽**: `/api/video/chinese/category/{type}`
- **最新更新**: `/api/video/chinese/latest`
- **熱門內容**: `/api/video/chinese/popular`

### 4.3 內容分類系統

**主要分類：**
- **劇情片** (`drama`)
- **動作片** (`action`)
- **喜劇片** (`comedy`)
- **愛情片** (`romance`)
- **恐怖片** (`horror`)
- **科幻片** (`sci-fi`)

**API 調用示例：**
```
GET /api/video/chinese/category/drama?subtitle=chinese&page=1&limit=20
```

### 4.4 播放器配置

**支援的播放器類型：**
1. **IjkPlayer** - 主要播放器
   - 支援 MP4, M3U8, RTMP
   - 硬體加速解碼
   - 字幕同步顯示

2. **WebView Player** - 網頁播放器
   - HTML5 Video 標籤
   - JavaScript 控制介面
   - 跨平台相容性

3. **ExoPlayer** - 高階播放器
   - 自適應串流
   - DRM 支援
   - 低延遲播放

## 五、網路請求處理機制

### 5.1 請求攔截與處理

**主要處理類：** `a.java` (網路請求管理器)

**關鍵方法：**
- `a.a.o()` - 處理動態伺服器請求
- 行號 1640-1680 包含伺服器選擇邏輯

### 5.2 錯誤處理與故障轉移

```java
// 伺服器故障轉移邏輯
if (server_response_failed) {
    // 切換到備用伺服器
    switchToBackupServer();
    // 重試請求
    retryRequest();
}
```

**故障轉移順序：**
1. 主要伺服器
2. 鏡像伺服器 1
3. 鏡像伺服器 2
4. CDN 備份伺服器

### 5.3 快取策略

**快取層級：**
- **記憶體快取** - 熱門內容列表
- **磁碟快取** - 影片縮圖、字幕檔案
- **網路快取** - API 回應快取

## 六、播放器整合分析

### 6.1 播放器選擇邏輯

```java
// n.java 中的播放器選擇邏輯
public void selectPlayer(String content_type, String url) {
    if (content_type.contains("anime")) {
        // 動畫內容優先使用 IjkPlayer
        useIjkPlayer(url);
    } else if (content_type.contains("chinese")) {
        // 中文內容支援多播放器
        if (url.contains(".m3u8")) {
            useIjkPlayer(url);
        } else {
            useExoPlayer(url);
        }
    }
}
```

### 6.2 字幕同步機制

**字幕載入流程：**
1. 解析影片元數據
2. 檢查可用字幕軌道
3. 下載字幕檔案
4. 同步時間軸
5. 渲染字幕顯示

## 七、安全性與反檢測機制

### 7.1 API 請求加密

**加密方法：**
- 請求頭動態生成
- URL 參數混淆
- 時間戳驗證
- 簽名校驗

### 7.2 反爬蟲機制

**防護措施：**
- User-Agent 輪換
- 請求頻率限制
- IP 白名單檢查
- 驗證碼機制

## 八、數據庫與本地存儲

### 8.1 SharedPreferences 配置

**關鍵配置項：**
```java
// f.java 中的配置讀取
az = new ArrayList(); // 伺服器列表快取
aA = new ArrayList(); // 內容列表快取  
aB = new ArrayList(); // 用戶偏好設定
```

### 8.2 SQLite 資料庫

**主要表結構：**
- **servers** - 伺服器配置
- **content** - 內容快取
- **history** - 觀看記錄
- **favorites** - 收藏列表

## 九、總結與建議

### 9.1 三個來源的技術特點

1. **動畫頁籤**：
   - 使用 IjkPlayer 為主要播放器
   - 支援劇集連續播放
   - 具備完整的搜尋和分類功能

2. **LIMIT1 中文字幕**：
   - 需要年齡驗證機制
   - 具備嚴格的存取控制
   - 支援高品質字幕同步

3. **中文1 中文字幕**：
   - 多播放器支援
   - 豐富的內容分類
   - 優秀的用戶體驗

### 9.2 API 使用建議

- 實現故障轉移機制確保服務穩定性
- 使用適當的快取策略提升效能
- 遵循內容分級和存取控制規範
- 實現完整的錯誤處理機制

### 9.3 擴展可能性

- 支援更多字幕語言
- 增加播放品質選擇
- 實現離線下載功能
- 添加社交分享功能 