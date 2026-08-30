# Helium Nova

Playnite 桌面模式主题。基于 [darklinkpower/Helium](https://github.com/darklinkpower/Helium) 1.71，为 Playnite 10.5x 重新整理，并与 [Theme Forge](https://github.com/Whereis-Alice/PlayniteThemeForge) 深度集成——**155 个选项、34 套预设，全部可在设置里带实时预览地调整，中英双语。**

---

## 依赖

| | |
|---|---|
| Playnite | 10.5 及以上（桌面模式） |
| **Theme Forge** | 必需。主题的全部可调项都由它渲染 |
| ThemeOptions / ThemeModifier | 不需要。仍保留 `thememodifier.yaml` 以便老插件用户平滑过渡 |

> 只装主题不装 Theme Forge 也能用，但你只会得到一套固定外观，改不了任何东西。

---

## 相对上游 Helium 的变化

### 新增显示功能

| 功能 | 说明 |
|---|---|
| 详情视图音乐播放器 | 在编辑按钮左侧嵌入 Playnite Sounds Mod 的播放控件，可开关（`DetailsViewMusicControlVisibility`） |
| 网格视图音乐区块 | 网格详情里新增可折叠的「音乐」区块，位置可在 0–18 之间任意排序（`GridViewSectionOrderMusic`），未装 Sounds Mod 时自动隐藏 |
| 侧边栏 Logo | 主菜单图标尺寸可调（`SidebarLogoSize`）、可整体隐藏（`SidebarLogoVisibility`） |
| 侧边栏按钮 | 按钮尺寸（`SidebarItemSize`）与未选中态透明度（`SidebarItemOpacity`）可调 |
| 区块标题文案 | 音乐区块标题可自定义（`MusicSectionHeader`） |

这些都走 `DynamicResource`，改完立刻生效，不用重启。

### 可调项：12 组 / 155 项

| 分组 | 内容 |
|---|---|
| 顶栏 | 导航按钮、搜索框宽度等 |
| 侧边栏 | Logo、按钮尺寸与透明度 |
| 详情视图 | 描述宽度与停靠、信息面板默认展开、背景图对齐/不透明度/模糊强度/蒙版颜色、投影、Logo、HLTB 表格、Web 视图高度 |
| 网格详情 | 描述位置、图标可见性、Logo、HLTB 表格 |
| 网格封面 | 悬停缩放、副标题与完成状态、高光动画、运行中发光边框、收藏图标、平台横幅、圆角、投影 |
| 区块排序 | 16 个滑块，把详情 / 视频 / 笔记 / 描述 / VNDB / 成就 / HLTB / 截图 / 活动 / 评测 / 新闻 / DLC / 关联 / Steam 截图 / 网页 / 音乐 排成任意顺序 |
| 排版 | 字号阶梯、字体族、字重 |
| 配色 | 强调色、字形色、悬停色、背景色 |
| 控件 | 按钮、滑块、输入框细节 |
| 状态色 | 运行中、已安装、完成状态等语义色 |
| 形状 | 各级圆角 |
| 集成 | 各扩展相关区块的显隐 |

### 预设：7 组 / 31 套

| 预设组 | 选项 |
|---|---|
| 强调色 | Azure / Cyan / Violet / Magenta / Emerald / Amber / Crimson / Rose / Slate（每套重绘图标、高亮、渐变按钮、进度条、封面占位、菜单悬停、窗口边框与弹窗色调）|
| 背景 | Nebula / Midnight / Graphite / Ocean / Plum / Forest（渐变背景，含线性与径向） |
| 背景压暗 | 轻度 / 中度 / 重度（压暗详情页背景图，同时联动模糊强度，明亮封面下也能看清信息面板） |
| 按钮 | Accent / Flat / Monochrome |
| 圆角 | Sharp / Rounded / Pill |
| 字号 | Compact / Large / Huge |
| 字体 | 微软雅黑 / Noto Sans SC / Segoe UI / 思源黑体 |
| 密度 | Compact / Relaxed / Touch |

每组自动带一个「默认」选项，随时回到主题原始外观。

### 其他修正

- 主题 Id / 名称 / 作者 / 仓库链接全部换新，可与原版 Helium 并存安装，互不覆盖。
- `Constants.xaml` 里补注释说明 `ControlCornerRadiusValue` 因为经由 `StaticResource` 传递而无法热更新，改为暴露它派生出的各个 `CornerRadius` 键。
- 不再暴露上游已无任何引用的死常量（如 `SidebarItemPadding`）。
- 全部 108 个 xaml、155 个变量 key、264 组双语本地化串、18 个预设文件都经过离线校验工具静态检查，**0 错误 0 警告**。

---

## 安装

1. 先装 [Theme Forge](https://github.com/Whereis-Alice/PlayniteThemeForge)。
2. 到 [Releases](https://github.com/Whereis-Alice/Helium-Nova/releases) 下载 `.pthm` 双击安装；或把 `source/` 的内容复制到
   `%APPDATA%\Playnite\Themes\Desktop\9c003378-5914-4a67-aa61-469eff798337\`。
3. **设置 → 外观 → 主题**选择 Helium Nova，重启。
4. **设置 → 扩展 → Theme Forge** 开始调。

---

## 从原版 Helium 迁移

主题 Id 不同，所以两者可以共存，原版设置不会被动到。要搬旧配置：

1. 装好 Helium Nova 并切换过去。
2. Theme Forge → **关于 → 从 ThemeOptions / ThemeModifier 导入**。

会自动带过来的：主题选项取值、预设选择、颜色与纯色画刷、bool / 数值常量。

> ⚠️ **渐变画刷不会被迁移，需要手工重建。** 如果你以前在 ThemeModifier 里改过窗口背景、按钮背景之类的渐变，导入后它们仍是主题默认值。
> 好消息是这些现在有现成预设了：**预设 → 背景**里的 6 套渐变、**预设 → 按钮**里的 3 套，直接选一个通常比手搓渐变停靠点更省事。要精确控制就复制 `source/Presets/Background/` 下任意一个 xaml 改改。

---

## 推荐扩展

主题通过 `extensions.yaml` 声明了 23 个推荐扩展；缺哪些会在 Theme Forge 的「扩展」页列出来。全都是**可选**的——没装对应扩展时相关区块自动隐藏，不会留空白。

主要几个：

- **ThemeExtras** / **Extra Metadata Loader** — Logo、视频、平台横幅
- **BackgroundChanger** — 背景图
- **SuccessStory** / **GameActivity** / **HowLongToBeat** / **ScreenshotsVisualizer** — 详情区块
- **VNDB Nexus** — 视觉小说信息区块
- **Playnite Sounds Mod** — 音乐播放器（本主题新增的集成点）
- **Web Explorer** — 内嵌网页区块
- **Steam News / Reviews / Store Screenshots Viewer** — Steam 相关区块

---

## 自己改

```powershell
# 打包成 .pthm
./build/build.ps1

# 静态校验（需要 Theme Forge 仓库）
../PlayniteThemeForge/tools/validator/bin/Release/Validator.exe ./source
```

加新选项的流程：在 `source/Constants.xaml` 里加 `x:Key` → 在需要的 View 里用 `{DynamicResource ...}` 引用 → 在 `source/themeforge.yaml` 里声明 → 在 `source/Localization/{en_US,zh_CN}.xaml` 里加两条文案 → 跑校验工具。

schema 细节见 [Theme Forge 的说明](https://github.com/Whereis-Alice/PlayniteThemeForge#给主题作者themeforgeyaml)。

---

## 许可与致谢

MIT。

原版 Helium 由 **[darklinkpower](https://github.com/darklinkpower)**（Brandon Balderas）创作，MIT 授权。Helium Nova 是它的衍生作品，版权声明与许可条款完整保留在 [LICENSE](LICENSE) 里。这个主题绝大部分的设计功劳属于原作者，这里做的是适配、扩展和工具化。

