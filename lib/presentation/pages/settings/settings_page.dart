import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ListView(
        children: [
          _buildSection(
            context,
            title: '播放設定',
            children: [
              _buildSwitchTile(
                context,
                title: '自動播放下一集',
                subtitle: '當前影片結束時自動播放下一集',
                value: true,
                onChanged: (value) {
                  // 實作自動播放設定
                },
              ),
              _buildSwitchTile(
                context,
                title: '背景播放',
                subtitle: '允許應用程式在背景繼續播放',
                value: false,
                onChanged: (value) {
                  // 實作背景播放設定
                },
              ),
              _buildSliderTile(
                context,
                title: '預設音量',
                subtitle: '設定應用程式啟動時的預設音量',
                value: 0.8,
                onChanged: (value) {
                  // 實作音量設定
                },
              ),
            ],
          ),
          _buildSection(
            context,
            title: '顯示設定',
            children: [
              _buildSwitchTile(
                context,
                title: '深色模式',
                subtitle: '使用深色主題以減少眼睛疲勞',
                value: true,
                onChanged: (value) {
                  // 實作深色模式切換
                },
              ),
              _buildListTile(
                context,
                title: '影片品質',
                subtitle: '自動',
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  _showQualityDialog(context);
                },
              ),
              _buildSwitchTile(
                context,
                title: '顯示字幕',
                subtitle: '預設顯示字幕（如果可用）',
                value: true,
                onChanged: (value) {
                  // 實作字幕顯示設定
                },
              ),
            ],
          ),
          _buildSection(
            context,
            title: '網路設定',
            children: [
              _buildSwitchTile(
                context,
                title: '僅Wi-Fi播放',
                subtitle: '只在Wi-Fi連接時播放影片',
                value: false,
                onChanged: (value) {
                  // 實作Wi-Fi限制設定
                },
              ),
              _buildSwitchTile(
                context,
                title: '預載下一集',
                subtitle: '自動預載下一集以提升觀看體驗',
                value: true,
                onChanged: (value) {
                  // 實作預載設定
                },
              ),
            ],
          ),
          _buildSection(
            context,
            title: '關於',
            children: [
              _buildListTile(
                context,
                title: '版本資訊',
                subtitle: 'AVTV v1.0.0',
                onTap: () {
                  _showAboutDialog(context);
                },
              ),
              _buildListTile(
                context,
                title: '隱私政策',
                subtitle: '查看我們的隱私政策',
                trailing: const Icon(Icons.open_in_new),
                onTap: () {
                  // 開啟隱私政策
                },
              ),
              _buildListTile(
                context,
                title: '使用條款',
                subtitle: '查看使用條款和服務協議',
                trailing: const Icon(Icons.open_in_new),
                onTap: () {
                  // 開啟使用條款
                },
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ...children,
        const Divider(height: 1),
      ],
    );
  }

  Widget _buildSwitchTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).primaryColor,
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildSliderTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle),
          const SizedBox(height: 8),
          Slider(
            value: value,
            onChanged: onChanged,
            activeColor: Theme.of(context).primaryColor,
          ),
          Text(
            '${(value * 100).round()}%',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  void _showQualityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('影片品質'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text('自動'),
              value: 'auto',
              groupValue: 'auto',
              onChanged: (value) {
                Navigator.of(context).pop();
              },
            ),
            RadioListTile<String>(
              title: const Text('1080p'),
              value: '1080p',
              groupValue: 'auto',
              onChanged: (value) {
                Navigator.of(context).pop();
              },
            ),
            RadioListTile<String>(
              title: const Text('720p'),
              value: '720p',
              groupValue: 'auto',
              onChanged: (value) {
                Navigator.of(context).pop();
              },
            ),
            RadioListTile<String>(
              title: const Text('480p'),
              value: '480p',
              groupValue: 'auto',
              onChanged: (value) {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'AVTV',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(
        Icons.play_circle_filled,
        size: 64,
      ),
      children: [
        const Text('一個功能豐富的串流影片播放器'),
        const SizedBox(height: 8),
        const Text('支援多種資料源和高畫質播放'),
        const SizedBox(height: 8),
        const Text('適用於手機和電視使用'),
      ],
    );
  }
} 