# 睡眠 App（Ambient Matrix / NoiseSleep）

## 产品定位

"声音艺术 + AI 睡眠疗愈 + 沉浸氛围系统"，不是普通噪音检测工具。
参考标杆：Calm、Endel、Portal、Dark Noise。用户打开后像进入一个"声音宇宙"。

## MVP 功能

- 实时分贝检测（声音雷达，非传统仪表盘）
- 白噪音播放器（多种白噪音 + 专属动态背景）
- AI 睡眠推荐
- 订阅页面

## 已确定功能

**功能模块：**
- 实时噪音检测 + AI 环境识别（交通/工地/咖啡厅/地铁等）
- 报告页（动态热力图、AI 分析摘要、睡眠影响分析）
- 声音记录页（声音记忆档案馆风格）
- 情景回放（沉浸式声音宇宙）
- Sleep 模块：白噪音播放 + 动态背景 + 呼吸引导 + 混音工作室
- 专注模式（Coding Space / Study Focus / Deep Work）
- 多主题系统（10 个主题，每个主题独立视觉/粒子/颜色）

**iOS 专属：**
- Live Activity（灵动岛/锁屏）
- Widget
- Dynamic Island 风格视觉
- OLED 光效

**Android 专属：**
- 大尺寸 Widget
- 通知栏播放控制
- 锁屏播放
- 后台稳定播放
- 不做 Apple Watch / Dynamic Island

**UI 风格方向（已更新）：**
- 从"冷淡科技感"改为"治愈可爱、温暖陪伴感"
- 目标关键词：cute dreamy cozy soft healing sleepy kawaii companion
- 深色背景保留，紫色系 → 奶紫/粉紫/蓝紫
- 按钮更柔软有漂浮感，卡片更圆润果冻感
- 呼吸球：像月亮/梦境泡泡，不要科幻能量核心
- 目标用户感受：「好舒服、像进入梦境、想每天晚上打开」

## 后续版本功能

- Apple Watch 遥控白噪音 + 睡眠心率联动（V3）
- Wear OS（低优先级）
- AI 自动混音 + 情绪疗愈
- 云同步

## UI/设计方向

- OLED 深黑背景
- 动态粒子、流体动画
- 毛玻璃果冻感 UI
- 多主题：深空黑金 / 极光蓝紫 / 森林雨夜 / 深海静谧 / 赛博霓虹 / 日式禅意 / 暖色睡眠 / 东京雨夜 等

## 技术方案

- Flutter 主 App
- iOS 原生扩展：WatchOS Target / WidgetExtension / LiveActivityExtension
- Flutter 处理后台播放，iOS 原生必须特别处理音频焦点、蓝牙控制、息屏不断音
- Android 后台播放需要 Kotlin 原生插件处理
- RevenueCat 订阅
- Firebase 基础

## 商业模式

- 免费：基础白噪音 + 基础检测
- Premium 解锁：所有白噪音 + AI 功能 + 高级主题 + 无广告 + 空间音频 + 云同步

## 风险与问题

- Android 后台播放稳定性是核心技术难点
- Apple Watch 会大幅增加开发工作量，建议 V3 再做
- iOS 音频合规（IDFA、隐私描述）需要仔细处理
