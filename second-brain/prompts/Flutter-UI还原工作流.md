# Prompt：Flutter UI 还原工作流（南湖 MCP + OC 代码）

用途说明：用于将蓝湖/南湖设计稿还原为 Flutter 代码。使用 OC/UIKit 代码作为结构中间层，比直接使用 Figma 节点树更稳定，AI 转换错误率更低。

内容：

```
下面是蓝湖/南湖导出的 iOS OC/UIKit 代码，它只作为 UI 结构和样式参考。
请不要逐行翻译 OC。
请结合截图视觉效果，用 Flutter 原生组件重新实现。

要求：
- 优先生成合理的 Flutter 组件结构
- UILabel → Text
- UIImageView → Image
- UIButton → GestureDetector / TextButton / InkWell
- UIView 容器 → Container / Stack / Row / Column
- frame 仅作为尺寸和间距参考，不要机械绝对定位
- 复杂装饰、渐变、背景、异形图形优先使用图片资源
- 保持代码可维护、组件层级清晰

[在此粘贴 OC 代码]
```

**完整工作流步骤：**

1. **截图视觉理解**：截图给 AI，让它理解最终视觉效果
2. **南湖 MCP 获取数据**：
   - 获取关键尺寸/颜色/字体/间距
   - 选中目标组件，导出 OC/UIKit 代码
   - 导出需要的图片/SVG 素材
3. **AI 重构 Flutter**：使用上面的 Prompt，OC 代码作为结构参考，不逐行翻译
4. **复杂背景图片化**：渐变/装饰/异形图形直接用图片资源，不要尝试用代码实现

**关键原则：**
- 禁止直接使用 Figma MCP 的完整节点树生成页面代码（节点树噪音多，AI 容易生成错误结构）
- OC 代码只作为结构、样式、尺寸参考，禁止逐行翻译
- 最终必须按 Flutter 组件习惯重构
- 截图是最终视觉标准，OC 代码是结构参考

**为什么 OC 代码比 Figma 节点树好：**
- OC/UIKit 已经工程化，过滤掉了 Figma 中无意义的 Frame/Mask/Vector 嵌套
- UIView/UILabel/UIImageView 与 Flutter 的 Container/Text/Image 映射直接
- AI 能做"语义迁移"而不是"节点翻译"，生成的代码结构更合理
