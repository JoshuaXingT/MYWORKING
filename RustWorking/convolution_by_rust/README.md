# LOL 闪现声音识别

## 原理

* 使用 IAudioCaptureClient 捕获系统声音
* 使用卷积识别基本闪现声音的特征
* 使用一个手动分析出来的经验，纯手写的匹配函数来判断

## 识别效果

* 在总音量大小为中等、并且其他声音叠加不是特别严重时识别最准确。
* 在总音量大小特别大时，假阳性会偏高。
* 在总音量大小较小时，可能无法识别。
* 在背景音乐、其他技能音效较多时可能无法识别或出现假阳性。

## 运行

```bash
cargo run --release
```

注意：需要使用 Release 模式运行，Debug 运行的效率太低。
