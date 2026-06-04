#!/usr/bin/env bash
# 用法：./remove_app.sh <app_id>
# 示例：./remove_app.sh weather

set -e

if [ $# -lt 1 ]; then
  echo ""
  echo "用法：  ./remove_app.sh <app_id>"
  echo "示例：  ./remove_app.sh weather"
  echo ""
  exit 1
fi

APP_ID="$1"

# ── 检查是否存在 ──────────────────────────────────────────
if [ ! -f "apps/${APP_ID}.html" ] && [ ! -f "privacy/${APP_ID}.html" ] && [ ! -f "terms/${APP_ID}.html" ]; then
  echo "⚠️  找不到 ${APP_ID} 的页面文件，请确认 app_id 是否正确。"
  exit 1
fi

# ── 二次确认 ──────────────────────────────────────────────
echo ""
echo "即将删除 ${APP_ID} 的所有页面："
echo "  apps/${APP_ID}.html"
echo "  privacy/${APP_ID}.html"
echo "  terms/${APP_ID}.html"
echo "  以及 index.html 中的对应卡片"
echo ""
read -p "确认删除？输入 yes 继续：" CONFIRM
if [ "$CONFIRM" != "yes" ]; then
  echo "已取消。"
  exit 0
fi

# ── 删除文件 ──────────────────────────────────────────────
[ -f "apps/${APP_ID}.html" ]     && rm "apps/${APP_ID}.html"     && echo "  ✓ 删除 apps/${APP_ID}.html"
[ -f "privacy/${APP_ID}.html" ]  && rm "privacy/${APP_ID}.html"  && echo "  ✓ 删除 privacy/${APP_ID}.html"
[ -f "terms/${APP_ID}.html" ]    && rm "terms/${APP_ID}.html"    && echo "  ✓ 删除 terms/${APP_ID}.html"

# ── 从 index.html 移除卡片 ────────────────────────────────
python3 - <<PYEOF
import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 匹配 <!-- app_id --> 开头的整张卡片，直到 </a> 结束
pattern = r'\n\s*<!-- ${APP_ID} -->\n.*?</a>\n'
new_content = re.sub(pattern, '\n', content, flags=re.DOTALL)

if new_content == content:
    print("  ⚠️  index.html 中未找到 ${APP_ID} 的卡片，请手动删除")
else:
    with open('index.html', 'w', encoding='utf-8') as f:
        f.write(new_content)
    print("  ✓ index.html 卡片已移除")
PYEOF

echo ""
echo "✅ ${APP_ID} 删除完成！"
echo ""
echo "   下一步：推送到 GitHub"
echo "   git add . && git commit -m 'feat: remove ${APP_ID} pages' && git push"
echo ""
