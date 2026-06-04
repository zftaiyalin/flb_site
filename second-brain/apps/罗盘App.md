# 罗盘 App

## 产品定位

中国传统国风工具 App，融合罗盘、八字、黄历、风水、灵签、指南针于一体。面向对国学、玄学感兴趣的用户。UI 风格：国风红金、水墨、宣纸质感。

## MVP 功能

- 电子罗盘（实时方位）
- 指南针
- 黄历（日历）
- 灵签/抽签
- 天气
- 基础风水方位展示

## 已确定功能

- 八字排盘（本地计算，不走云端）
- 风水吉位方向
- 国风 UI：红金色系 + 水墨装饰
- RevenueCat 订阅体系
- AdMob / CSJ 广告（国内用 CSJ，海外用 AdMob）
- Firebase 基础接入（Analytics + Crashlytics，不做复杂埋点）
- App Store + Google Play 双端上架

## 后续版本功能

- **V2：** Widget（桌面小组件）、锁屏组件、灵动岛方向追踪
- **V2：** Apple Watch（方位 Complication、风水模式）
- **V3：** 八字 AI 解读
- **Android 不做：** Watch 生态、灵动岛（Android 生态碎片化，价值低）

## UI/设计方向

- 国风红金主色调
- 水墨山水背景
- 宣纸纹理
- 祥云、梅花、仙鹤装饰元素
- App Store 宣传图：1242×2688px，红色中国风模板

## 技术方案

- Flutter 全平台开发
- 本地排盘算法（降低服务器成本，提高审核通过率）
- RevenueCat 订阅管理
- Firebase Core + Analytics + Crashlytics
- 广告层抽象：`AdService` 接口，国内 CSJ 实现，Google Play AdMob 实现
- 蓝湖/南湖 MCP + OC 代码作为 UI 还原中间层

## 商业模式

- 订阅制（月订/年订）
- 激励广告（非强制，不打断体验）
- 免费功能足够基础使用，Premium 解锁高级功能

## 风险与问题

- Apple 审核对玄学/命理内容有一定风险，需要产品定位"工具"而非"算命"
- 八字本地排盘精度需要验证
- 国风 UI 维护成本较高（大量装饰素材）
