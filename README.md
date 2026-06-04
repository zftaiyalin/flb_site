# FLB Studio Site

FLB Studio 官方网站，基于纯静态 HTML，托管于 GitHub Pages。

## 站点结构

```
flb_site/
├── index.html          # 营销首页
├── shared.css          # 公共样式
├── support.html        # 支持 & FAQ
├── contact.html        # 联系表单
├── add_app.sh          # 一键新增 APP 脚本
├── apps/
│   └── {app_id}.html   # APP 介绍页
├── privacy/
│   └── {app_id}.html   # 隐私政策页
└── terms/
    └── {app_id}.html   # 用户协议页
```

## 新增 APP 页面

### 用法

```bash
./add_app.sh <app_id> <app_name> <emoji_or_icon> [描述]
```

| 参数 | 说明 | 示例 |
|------|------|------|
| `app_id` | 英文 ID，小写，用于文件名和 URL | `weather` |
| `app_name` | 应用显示名称 | `Weather` |
| `emoji_or_icon` | Emoji 图标，或本地图片路径 | `⛅` 或 `icons/weather.png` |
| `描述` | 可选，应用简介 | `精准天气预报` |

### 示例

**使用 Emoji 图标：**
```bash
./add_app.sh weather "Weather" "⛅" "精准天气预报，掌握每日天气变化"
```

**使用本地图片：**
```bash
./add_app.sh weather "Weather" "icons/weather.png" "精准天气预报，掌握每日天气变化"
```

### 执行后自动生成

```
apps/weather.html
privacy/weather.html
terms/weather.html
```

同时自动在 `index.html` 首页插入该 APP 的卡片。

### 完整流程

```bash
# 1. 生成页面
./add_app.sh weather "Weather" "⛅" "精准天气预报，掌握每日天气变化"

# 2. 编辑 apps/weather.html，补全核心功能列表

# 3. 推送上线
git add .
git commit -m "feat: add Weather pages"
git push
```

推送后 GitHub Pages 约 1 分钟自动部署，页面即可访问。

### 部署后 URL

```
https://flbapp.com/apps/weather.html
https://flbapp.com/privacy/weather.html
https://flbapp.com/terms/weather.html
```

## 删除 APP 页面

```bash
./remove_app.sh <app_id>
```

执行后会二次确认，输入 `yes` 才会删除。

**删除内容：**
- `apps/{app_id}.html`
- `privacy/{app_id}.html`
- `terms/{app_id}.html`
- `index.html` 中的对应卡片

**示例：**
```bash
./remove_app.sh weather

# 确认提示后推送
git add . && git commit -m "feat: remove Weather pages" && git push
```

## 当前 APP 列表

| APP | 介绍页 | 隐私政策 | 用户协议 |
|-----|--------|---------|---------|
| 🧭 Compass | [apps/compass.html](apps/compass.html) | [privacy/compass.html](privacy/compass.html) | [terms/compass.html](terms/compass.html) |
| 🌙 Sleep | [apps/sleep.html](apps/sleep.html) | [privacy/sleep.html](privacy/sleep.html) | [terms/sleep.html](terms/sleep.html) |
| ⚒️ Forge | [apps/forge.html](apps/forge.html) | [privacy/forge.html](privacy/forge.html) | [terms/forge.html](terms/forge.html) |
