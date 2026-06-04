#!/usr/bin/env bash
# 用法：./add_app.sh <app_id> <app_name> <emoji_icon> [描述]
# 示例：./add_app.sh weather "Weather" "⛅" "精准天气预报，掌握每日天气变化"

set -e

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
TODAY_EN=$(date +"%B %-d, %Y")

if [ -f "apps/${APP_ID}.html" ]; then
  echo "⚠️  apps/${APP_ID}.html 已存在，跳过（不覆盖）"
  echo "   如需更新，请手动编辑对应文件。"
  exit 0
fi

if [[ "$APP_ICON" == *"."* ]]; then
  ICON_HTML="<img class=\"page-hero-icon\" src=\"../${APP_ICON}\" alt=\"${APP_NAME}\" />"
  CARD_ICON="<img class=\"app-icon\" src=\"${APP_ICON}\" alt=\"${APP_NAME}\" />"
else
  ICON_HTML="<div class=\"page-hero-icon-placeholder\">${APP_ICON}</div>"
  CARD_ICON="<div class=\"app-icon-placeholder\">${APP_ICON}</div>"
fi

echo ""
echo "正在创建 ${APP_NAME} (${APP_ID}) 的页面..."

# ══════════════════════════════════════════════════════════
# 1. apps/<app_id>.html
# ══════════════════════════════════════════════════════════
cat > "apps/${APP_ID}.html" <<HTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${APP_NAME} — FLB Studio</title>
  <script src="../lang.js"></script>
  <link rel="stylesheet" href="../shared.css" />
</head>
<body>
<header>
  <a class="logo" href="../index.html">FLB Studio</a>
  <nav>
    <a href="../index.html#apps"><span class="zh">产品</span><span class="en">Apps</span></a>
    <a href="../support.html"><span class="zh">支持</span><span class="en">Support</span></a>
    <a href="../contact.html"><span class="zh">联系我们</span><span class="en">Contact</span></a>
    <button class="lang-btn" onclick="flbToggleLang()"><span class="zh">EN</span><span class="en">中</span></button>
  </nav>
</header>

<div class="page-hero">
  ${ICON_HTML}
  <div>
    <div class="badge">APP</div>
    <h1>${APP_NAME}</h1>
    <p>
      <span class="zh">${APP_DESC}</span>
      <span class="en"><!-- TODO: English tagline --></span>
    </p>
  </div>
</div>

<hr class="divider" />

<div class="content">
  <div class="zh">
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

  <div class="en">
    <h2>About ${APP_NAME}</h2>
    <p><!-- TODO: English description --></p>

    <h2>Key Features</h2>
    <ul>
      <li>Feature 1</li>
      <li>Feature 2</li>
      <li>Feature 3</li>
    </ul>

    <h2>Links</h2>
    <ul>
      <li><a href="../privacy/${APP_ID}.html">Privacy Policy</a></li>
      <li><a href="../terms/${APP_ID}.html">Terms of Use</a></li>
      <li><a href="../support.html">Support &amp; FAQ</a></li>
    </ul>
  </div>
</div>

<footer>
  <p>© 2025 FLB Studio. All rights reserved.</p>
  <p style="margin-top:12px">
    <a href="../support.html"><span class="zh">支持</span><span class="en">Support</span></a>
    <a href="../contact.html"><span class="zh">联系我们</span><span class="en">Contact</span></a>
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
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${APP_NAME} Privacy Policy — FLB Studio</title>
  <script src="../lang.js"></script>
  <link rel="stylesheet" href="../shared.css" />
</head>
<body>
<header>
  <a class="logo" href="../index.html">FLB Studio</a>
  <nav>
    <a href="../index.html#apps"><span class="zh">产品</span><span class="en">Apps</span></a>
    <a href="../support.html"><span class="zh">支持</span><span class="en">Support</span></a>
    <a href="../contact.html"><span class="zh">联系我们</span><span class="en">Contact</span></a>
    <button class="lang-btn" onclick="flbToggleLang()"><span class="zh">EN</span><span class="en">中</span></button>
  </nav>
</header>

<div class="page-hero">
  ${ICON_HTML}
  <div>
    <div class="badge"><span class="zh">隐私政策</span><span class="en">Privacy Policy</span></div>
    <h1>${APP_NAME}</h1>
    <p>
      <span class="zh">最后更新：${TODAY}</span>
      <span class="en">Last updated: ${TODAY_EN}</span>
    </p>
  </div>
</div>

<hr class="divider" />

<div class="content">

  <div class="zh">
    <h2>概述</h2>
    <p>FLB Studio（以下简称"我们"）重视您的个人隐私。本隐私政策说明了我们的 ${APP_NAME} 应用（以下简称"本应用"）在您使用期间如何收集、使用及保护相关信息。继续使用本应用即表示您已阅读并接受本政策。</p>

    <h2>我们收集的信息</h2>
    <h3>本地存储的偏好数据</h3>
    <p>${APP_NAME} 可能在您的设备本地存储应用偏好设置。这些数据仅存储于设备本地，不会上传至任何外部服务器。</p>

    <h3>我们不收集的信息</h3>
    <ul>
      <li>姓名、电子邮件地址或其他个人身份信息</li>
      <li>设备唯一标识符（IDFA、IDFV 或其他广告追踪 ID）</li>
      <li>使用习惯、行为分析或任何遥测数据</li>
      <li>任何经由网络传输的数据</li>
    </ul>

    <h2>如何使用信息</h2>
    <p>本地存储的偏好数据仅用于提供应用核心功能及恢复您的个人设置，不用于任何商业、广告或分析目的。</p>

    <h2>数据存储与安全</h2>
    <p>所有数据处理均在您的设备本地完成，本应用不向任何外部服务器发送数据。</p>

    <h2>信息共享</h2>
    <p>我们不会将您的任何信息出售、出租或以任何形式共享给第三方。</p>

    <h2>第三方服务</h2>
    <p>${APP_NAME} 不集成任何第三方分析、广告或崩溃追踪 SDK。本应用通过 Apple App Store 或 Google Play 分发；您的账户及支付信息受 Apple 或 Google 各自的隐私政策约束，与我们无关。</p>

    <h2>您的权利</h2>
    <ul>
      <li><strong>删除数据</strong>：卸载本应用即可清除设备上所有本地数据</li>
      <li><strong>提出疑问</strong>：您可通过下方联系方式与我们联系</li>
    </ul>

    <h2>儿童隐私</h2>
    <p>本应用不针对 13 岁以下（欧盟地区为 16 岁以下）的儿童。我们不会故意收集未成年人的个人信息。</p>

    <h2>隐私政策变更</h2>
    <p>我们可能因业务发展或法律合规需要不定期更新本政策。更新内容将在应用商店版本日志中注明；重大变更将至少提前 30 天通过应用内通知告知您。</p>

    <h2>适用法律</h2>
    <p>本政策受中华人民共和国相关法律法规管辖解释。</p>

    <h2>联系我们</h2>
    <p>如有任何隐私相关问题，请联系：<a href="mailto:zftaifei@gmail.com">zftaifei@gmail.com</a></p>
    <p>我们通常在 2 个工作日内回复。</p>
  </div>

  <div class="en">
    <h2>Overview</h2>
    <p>FLB Studio ("we," "us," or "our") is committed to protecting your privacy. This Privacy Policy explains how our ${APP_NAME} app ("the App") collects, uses, and safeguards information during your use. By continuing to use the App, you acknowledge that you have read and accepted this policy.</p>

    <h2>Information We Collect</h2>
    <h3>Locally Stored Preferences</h3>
    <p>${APP_NAME} may store app preferences locally on your device. This data stays on your device and is never uploaded to any external server.</p>

    <h3>Information We Do Not Collect</h3>
    <ul>
      <li>Name, email address, or other personally identifiable information</li>
      <li>Device unique identifiers (IDFA, IDFV, or other advertising IDs)</li>
      <li>Usage habits, behavioral analytics, or telemetry data</li>
      <li>Any data transmitted over the network</li>
    </ul>

    <h2>How We Use Information</h2>
    <p>Locally stored preferences are used solely to deliver the App's core functionality and restore your personal settings. They are not used for any commercial, advertising, or analytics purpose.</p>

    <h2>Data Storage &amp; Security</h2>
    <p>All data processing occurs locally on your device; the App does not send data to any external server.</p>

    <h2>Information Sharing</h2>
    <p>We do not sell, rent, or share any of your information with third parties in any form.</p>

    <h2>Third-Party Services</h2>
    <p>${APP_NAME} does not integrate any third-party analytics, advertising, or crash-tracking SDKs. The App is distributed through the Apple App Store or Google Play; your account and payment information is subject to Apple's or Google's respective privacy policies, which are independent of ours.</p>

    <h2>Your Rights</h2>
    <ul>
      <li><strong>Delete data:</strong> Uninstalling the App removes all locally stored data from your device</li>
      <li><strong>Raise questions:</strong> Contact us at the address below</li>
    </ul>

    <h2>Children's Privacy</h2>
    <p>The App is not directed at children under the age of 13 (or 16 in the EU). We do not knowingly collect personal information from minors.</p>

    <h2>Changes to This Policy</h2>
    <p>We may update this policy periodically. Updates will be noted in the App Store release notes; significant changes will be announced at least 30 days in advance via in-app notification.</p>

    <h2>Governing Law</h2>
    <p>This policy is governed and interpreted in accordance with applicable laws and regulations.</p>

    <h2>Contact Us</h2>
    <p>For any privacy-related questions, please contact: <a href="mailto:zftaifei@gmail.com">zftaifei@gmail.com</a></p>
    <p>We typically respond within 2 business days.</p>
  </div>

</div>

<footer>
  <p>© 2025 FLB Studio. All rights reserved.</p>
  <p style="margin-top:12px">
    <a href="../support.html"><span class="zh">支持</span><span class="en">Support</span></a>
    <a href="../contact.html"><span class="zh">联系我们</span><span class="en">Contact</span></a>
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
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${APP_NAME} Terms of Use — FLB Studio</title>
  <script src="../lang.js"></script>
  <link rel="stylesheet" href="../shared.css" />
</head>
<body>
<header>
  <a class="logo" href="../index.html">FLB Studio</a>
  <nav>
    <a href="../index.html#apps"><span class="zh">产品</span><span class="en">Apps</span></a>
    <a href="../support.html"><span class="zh">支持</span><span class="en">Support</span></a>
    <a href="../contact.html"><span class="zh">联系我们</span><span class="en">Contact</span></a>
    <button class="lang-btn" onclick="flbToggleLang()"><span class="zh">EN</span><span class="en">中</span></button>
  </nav>
</header>

<div class="page-hero">
  ${ICON_HTML}
  <div>
    <div class="badge"><span class="zh">用户协议</span><span class="en">Terms of Use</span></div>
    <h1>${APP_NAME}</h1>
    <p>
      <span class="zh">最后更新：${TODAY}</span>
      <span class="en">Last updated: ${TODAY_EN}</span>
    </p>
  </div>
</div>

<hr class="divider" />

<div class="content">

  <div class="zh">
    <h2>1. 协议接受</h2>
    <p>下载、安装或使用 ${APP_NAME}（以下简称"本应用"）即表示您接受本用户协议的所有条款。如不同意，请立即停止使用并卸载本应用。</p>

    <h2>2. 许可授予</h2>
    <p>FLB Studio 授予您一项个人、有限、非独家、不可转让、可撤销的许可，仅供您在您拥有或控制的 iOS / Android 设备上，以供个人、非商业目的使用本应用。</p>

    <h2>3. 使用限制</h2>
    <p>您不得：</p>
    <ul>
      <li>对本应用进行反编译、逆向工程、反汇编或尝试获取源代码</li>
      <li>复制、修改、分发、出售、租借或转授本应用的任何副本</li>
      <li>将本应用用于任何非法、欺诈或侵权目的</li>
      <li>删除或修改应用中的版权声明、商标或其他所有权标识</li>
    </ul>

    <h2>4. 知识产权</h2>
    <p>本应用及其所有内容均属 FLB Studio 的专有财产，受版权、商标及其他适用法律保护。</p>

    <h2>5. 责任限制</h2>
    <p>在适用法律允许的最大范围内，FLB Studio 对任何间接、偶然、特殊、后果性损害不承担责任，包括但不限于数据丢失、利润损失或业务中断。</p>

    <h2>6. 协议终止</h2>
    <p>若您违反本协议，您使用本应用的权利将自动终止。FLB Studio 保留在任何时候修改、暂停或终止本应用的权利。</p>

    <h2>7. 适用法律</h2>
    <p>本协议受中华人民共和国法律管辖。因使用本应用产生的任何争议，双方应首先协商解决；协商不成的，提交有管辖权的人民法院解决。</p>

    <h2>联系我们</h2>
    <p>对本协议有任何疑问，请联系：<a href="mailto:zftaifei@gmail.com">zftaifei@gmail.com</a></p>
  </div>

  <div class="en">
    <h2>1. Acceptance of Terms</h2>
    <p>By downloading, installing, or using ${APP_NAME} ("the App"), you accept all terms of this Terms of Use Agreement. If you do not agree, please stop using and uninstall the App immediately.</p>

    <h2>2. License Grant</h2>
    <p>FLB Studio grants you a personal, limited, non-exclusive, non-transferable, revocable license to use the App on iOS/Android devices that you own or control, solely for personal, non-commercial purposes.</p>

    <h2>3. Restrictions</h2>
    <p>You may not:</p>
    <ul>
      <li>Decompile, reverse engineer, disassemble, or attempt to derive the source code of the App</li>
      <li>Copy, modify, distribute, sell, rent, or sublicense any copy of the App</li>
      <li>Use the App for any illegal, fraudulent, or infringing purpose</li>
      <li>Remove or alter any copyright notice, trademark, or other proprietary markings in the App</li>
    </ul>

    <h2>4. Intellectual Property</h2>
    <p>The App and all its content are the exclusive property of FLB Studio and are protected by copyright, trademark, and other applicable laws.</p>

    <h2>5. Limitation of Liability</h2>
    <p>To the maximum extent permitted by applicable law, FLB Studio shall not be liable for any indirect, incidental, special, or consequential damages, including but not limited to data loss, lost profits, or business interruption.</p>

    <h2>6. Termination</h2>
    <p>Your right to use the App terminates automatically if you breach this Agreement. FLB Studio reserves the right to modify, suspend, or discontinue the App at any time.</p>

    <h2>7. Governing Law</h2>
    <p>This Agreement is governed by applicable laws and regulations. Disputes shall first be resolved through negotiation; if unresolved, they shall be submitted to a court of competent jurisdiction.</p>

    <h2>Contact Us</h2>
    <p>For questions about this Agreement, please contact: <a href="mailto:zftaifei@gmail.com">zftaifei@gmail.com</a></p>
  </div>

</div>

<footer>
  <p>© 2025 FLB Studio. All rights reserved.</p>
  <p style="margin-top:12px">
    <a href="../support.html"><span class="zh">支持</span><span class="en">Support</span></a>
    <a href="../contact.html"><span class="zh">联系我们</span><span class="en">Contact</span></a>
  </p>
</footer>
</body>
</html>
HTML

# ══════════════════════════════════════════════════════════
# 4. 自动更新 index.html 的 apps-grid
# ══════════════════════════════════════════════════════════
NEW_CARD="
    <!-- ${APP_ID} -->
    <a class=\"app-card\" href=\"apps/${APP_ID}.html\">
      ${CARD_ICON}
      <div class=\"app-name\">${APP_NAME}</div>
      <div class=\"app-desc\">
        <span class=\"zh\">${APP_DESC}</span>
        <span class=\"en\"><!-- TODO: English description --></span>
      </div>
      <div class=\"app-links\">
        <span class=\"app-link\"><span class=\"zh\">隐私政策</span><span class=\"en\">Privacy</span></span>
        <span class=\"app-link\"><span class=\"zh\">用户协议</span><span class=\"en\">Terms</span></span>
      </div>
    </a>"

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
echo "   待补充（搜索 TODO 标记）："
echo "   - apps/${APP_ID}.html  → 英文描述 & 功能列表"
echo "   - privacy/${APP_ID}.html → 补充应用特有的权限说明"
echo ""
echo "   下一步："
echo "   git add . && git commit -m 'feat: add ${APP_NAME} pages' && git push"
echo ""
