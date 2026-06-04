#!/usr/bin/env bash
# 用法：./add_app.sh <app_id> <app_name> <emoji_icon> [描述]
# 示例：./add_app.sh weather "Weather" "⛅" "精准天气预报，掌握每日天气变化"
#
# 参数说明：
#   app_id     — 英文 ID，小写，用于文件名和 URL（如 weather）
#   app_name   — 应用显示名称（如 Weather）
#   emoji_icon — Emoji 图标（如 ⛅），或图片路径（如 icons/weather.png）
#   描述       — 可选，应用简介，默认为空

set -e

# ── 参数检查 ──────────────────────────────────────────────
if [ $# -lt 3 ]; then
  echo ""
  echo "用法：  ./add_app.sh <app_id> <app_name> <emoji_icon> [描述]"
  echo "示例：  ./add_app.sh weather \"Weather\" \"⛅\" \"精准天气，掌握每日变化\""
  echo ""
  exit 1
fi

APP_ID="$1"
APP_NAME="$2"
APP_ICON="$3"
APP_DESC="${4:-$APP_NAME 应用}"
TODAY=$(date +"%Y 年 %-m 月 %-d 日")

# ── 检查是否已存在 ─────────────────────────────────────────
if [ -f "apps/${APP_ID}.html" ]; then
  echo "⚠️  apps/${APP_ID}.html 已存在，跳过（不覆盖）"
  echo "   如需更新，请手动编辑对应文件。"
  exit 0
fi

# 判断图标是 emoji 还是图片路径
if [[ "$APP_ICON" == *"."* ]]; then
  ICON_HTML="<img class=\"page-hero-icon\" src=\"../${APP_ICON}\" alt=\"${APP_NAME}\" />"
  ICON_HTML_ROOT="<img class=\"page-hero-icon\" src=\"${APP_ICON}\" alt=\"${APP_NAME}\" />"
  CARD_ICON="<img class=\"app-icon\" src=\"${APP_ICON}\" alt=\"${APP_NAME}\" />"
else
  ICON_HTML="<div class=\"page-hero-icon-placeholder\">${APP_ICON}</div>"
  ICON_HTML_ROOT="<div class=\"page-hero-icon-placeholder\">${APP_ICON}</div>"
  CARD_ICON="<div class=\"app-icon-placeholder\">${APP_ICON}</div>"
fi

echo ""
echo "正在创建 ${APP_NAME} (${APP_ID}) 的页面..."

# ══════════════════════════════════════════════════════════
# 1. apps/<app_id>.html
# ══════════════════════════════════════════════════════════
cat > "apps/${APP_ID}.html" <<HTML
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${APP_NAME} — FLB Studio</title>
  <link rel="stylesheet" href="../shared.css" />
</head>
<body>
<header>
  <a class="logo" href="../index.html">FLB Studio</a>
  <nav>
    <a href="../index.html#apps">产品</a>
    <a href="../support.html">支持</a>
    <a href="../contact.html">联系我们</a>
  </nav>
</header>

<div class="page-hero">
  ${ICON_HTML}
  <div>
    <div class="badge">APP</div>
    <h1>${APP_NAME}</h1>
    <p>${APP_DESC}</p>
  </div>
</div>

<hr class="divider" />

<div class="content">
  <h2>关于 ${APP_NAME}</h2>
  <p>${APP_DESC}</p>

  <h2>核心功能</h2>
  <ul>
    <li>功能一</li>
    <li>功能二</li>
    <li>功能三</li>
  </ul>

  <h2>相关链接</h2>
  <ul>
    <li><a href="../privacy/${APP_ID}.html">隐私政策</a></li>
    <li><a href="../terms/${APP_ID}.html">用户协议</a></li>
    <li><a href="../support.html">支持 &amp; FAQ</a></li>
  </ul>
</div>

<footer>
  <p>© 2025 FLB Studio. All rights reserved.</p>
  <p style="margin-top:12px">
    <a href="../support.html">支持</a>
    <a href="../contact.html">联系我们</a>
  </p>
</footer>
</body>
</html>
HTML

# ══════════════════════════════════════════════════════════
# 2. privacy/<app_id>.html
# ══════════════════════════════════════════════════════════
cat > "privacy/${APP_ID}.html" <<HTML
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${APP_NAME} 隐私政策 — FLB Studio</title>
  <link rel="stylesheet" href="../shared.css" />
</head>
<body>
<header>
  <a class="logo" href="../index.html">FLB Studio</a>
  <nav>
    <a href="../index.html#apps">产品</a>
    <a href="../support.html">支持</a>
    <a href="../contact.html">联系我们</a>
  </nav>
</header>

<div class="page-hero">
  ${ICON_HTML}
  <div>
    <div class="badge">隐私政策</div>
    <h1>${APP_NAME}</h1>
    <p>最后更新：${TODAY}</p>
  </div>
</div>

<hr class="divider" />

<div class="content">
  <h2>概述</h2>
  <p>FLB Studio（以下简称"我们"）非常重视您的隐私。本隐私政策说明了 ${APP_NAME} 应用如何收集、使用和保护您的个人信息。</p>

  <h2>我们收集的信息</h2>
  <h3>应用内数据</h3>
  <p>${APP_NAME} 可能在您的设备本地存储应用偏好设置，这些数据不会上传至任何服务器。</p>

  <h3>我们不收集的信息</h3>
  <ul>
    <li>我们不收集您的姓名、电子邮件或任何个人识别信息</li>
    <li>我们不使用广告追踪技术</li>
  </ul>

  <h2>数据安全</h2>
  <p>所有数据处理均在您的设备本地完成，我们不会将任何数据传输至外部服务器。</p>

  <h2>第三方服务</h2>
  <p>${APP_NAME} 不集成任何第三方分析或广告 SDK。</p>

  <h2>儿童隐私</h2>
  <p>我们不会故意收集 13 岁以下儿童的个人信息。如果您认为我们意外收集了此类信息，请通过下方联系方式告知我们。</p>

  <h2>隐私政策变更</h2>
  <p>我们可能会不时更新本隐私政策。任何重大变更将通过应用内通知告知您。</p>

  <h2>联系我们</h2>
  <p>如有任何关于隐私的疑问，请联系：<a href="mailto:zftaifei@gmail.com">zftaifei@gmail.com</a></p>
</div>

<footer>
  <p>© 2025 FLB Studio. All rights reserved.</p>
  <p style="margin-top:12px">
    <a href="../support.html">支持</a>
    <a href="../contact.html">联系我们</a>
  </p>
</footer>
</body>
</html>
HTML

# ══════════════════════════════════════════════════════════
# 3. terms/<app_id>.html
# ══════════════════════════════════════════════════════════
cat > "terms/${APP_ID}.html" <<HTML
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${APP_NAME} 用户协议 — FLB Studio</title>
  <link rel="stylesheet" href="../shared.css" />
</head>
<body>
<header>
  <a class="logo" href="../index.html">FLB Studio</a>
  <nav>
    <a href="../index.html#apps">产品</a>
    <a href="../support.html">支持</a>
    <a href="../contact.html">联系我们</a>
  </nav>
</header>

<div class="page-hero">
  ${ICON_HTML}
  <div>
    <div class="badge">用户协议</div>
    <h1>${APP_NAME}</h1>
    <p>最后更新：${TODAY}</p>
  </div>
</div>

<hr class="divider" />

<div class="content">
  <h2>接受条款</h2>
  <p>下载或使用 ${APP_NAME} 即表示您同意本用户协议的所有条款。如不同意，请勿使用本应用。</p>

  <h2>使用许可</h2>
  <p>FLB Studio 授予您有限的、非独家的、不可转让的许可，仅供个人非商业用途使用本应用。</p>

  <h2>使用限制</h2>
  <p>您不得：</p>
  <ul>
    <li>对应用进行逆向工程、反编译或反汇编</li>
    <li>将应用用于任何非法目的</li>
    <li>出售、出租或转让应用的使用权</li>
    <li>删除应用中的版权声明或标识</li>
  </ul>

  <h2>知识产权</h2>
  <p>应用中的所有内容均为 FLB Studio 的知识产权，受相关法律保护。</p>

  <h2>条款变更</h2>
  <p>我们保留随时修改本协议的权利。继续使用应用即表示您接受修改后的条款。</p>

  <h2>联系我们</h2>
  <p>如有疑问，请联系：<a href="mailto:zftaifei@gmail.com">zftaifei@gmail.com</a></p>
</div>

<footer>
  <p>© 2025 FLB Studio. All rights reserved.</p>
  <p style="margin-top:12px">
    <a href="../support.html">支持</a>
    <a href="../contact.html">联系我们</a>
  </p>
</footer>
</body>
</html>
HTML

# ══════════════════════════════════════════════════════════
# 4. 自动更新 index.html 的 apps-grid（插入新卡片）
# ══════════════════════════════════════════════════════════
NEW_CARD="
    <!-- ${APP_ID} -->
    <a class=\"app-card\" href=\"apps/${APP_ID}.html\">
      ${CARD_ICON}
      <div class=\"app-name\">${APP_NAME}</div>
      <div class=\"app-desc\">${APP_DESC}</div>
      <div class=\"app-links\">
        <span class=\"app-link\">隐私政策</span>
        <span class=\"app-link\">用户协议</span>
      </div>
    </a>"

# 在 </div> 结束标签前插入新卡片（匹配 apps-grid 的闭合标签）
# 使用 Python 做精确替换，避免 sed 多行问题
python3 - <<PYEOF
import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

marker = '  </div>\n</div>\n\n<footer'
replacement = '''${NEW_CARD}

  </div>
</div>

<footer'''

if '<!-- ${APP_ID} -->' in content:
    print("index.html 中已有该 APP 卡片，跳过")
else:
    new_content = content.replace(marker, replacement, 1)
    if new_content == content:
        print("⚠️  未找到插入点，请手动添加卡片到 index.html 的 #apps-grid")
    else:
        with open('index.html', 'w', encoding='utf-8') as f:
            f.write(new_content)
        print("  ✓ index.html 卡片已更新")
PYEOF

# ══════════════════════════════════════════════════════════
# 完成提示
# ══════════════════════════════════════════════════════════
echo ""
echo "✅ ${APP_NAME} 页面创建完成！"
echo ""
echo "   生成文件："
echo "   ├── apps/${APP_ID}.html"
echo "   ├── privacy/${APP_ID}.html"
echo "   └── terms/${APP_ID}.html"
echo ""
echo "   部署后 URL（替换域名）："
echo "   隐私政策 → https://yourdomain.com/privacy/${APP_ID}.html"
echo "   用户协议 → https://yourdomain.com/terms/${APP_ID}.html"
echo "   APP 页面 → https://yourdomain.com/apps/${APP_ID}.html"
echo ""
echo "   下一步：编辑 apps/${APP_ID}.html 补全核心功能列表"
echo "           git add . && git commit -m 'feat: add ${APP_NAME} pages'"
echo ""
