# iPhone 小螃蟹：第一阶段使用说明

目前是测试版：只有「在钓鱼」，在 App 里手动启动或收回。动画使用作者提供的计时器字体技巧；真机效果与耗电需要验证。

苹果规定实时活动最多持续 8 小时；到时灵动岛会自动移除它。需要继续使用时，重新打开 App 启动。

## 1. 在 GitHub 构建

把本工程全部文件上传到你创建的 GitHub 仓库 `yuhuaizhuge-rgb/Claude-icon` 的 `main` 分支。进入仓库的 **Actions → Build iPhone app → Run workflow**。首次上传 `main` 也会自动触发构建。等状态变绿，打开该次运行，在页面下方 **Artifacts** 下载 `CrabApp-unsigned-ipa`，解压得到 `CrabApp.ipa`。

如果构建显示红色，打开失败的 **Compile unsigned iPhone archive** 步骤，复制完整日志或下载 `xcodebuild-log`，发给 Codex 分析。不要只截最后一行。

## 2. 在 Windows 签名安装

从 [Sideloadly 官网](https://sideloadly.io/)安装 Windows 版。按它的提示安装所需的苹果设备驱动/iTunes、iCloud。用数据线连接 iPhone，解锁手机并选择「信任此电脑」。将 `CrabApp.ipa` 拖入 Sideloadly，输入你的免费 Apple ID，在 Sideloadly 中选择设备并开始安装。签名和安装时电脑需要能访问苹果服务。不要把 Apple ID 密码发给 Codex 或其他人。

如果 iPhone 提示无法打开开发者 App，在 **设置 → 通用 → VPN 与设备管理** 中找到对应开发者并信任。若系统提示开启开发者模式，在 **设置 → 隐私与安全性 → 开发者模式** 中开启并重启。设置名称可能随 iOS 版本变化。

## 3. 测试

打开「小螃蟹」，允许实时活动，点击「让螃蟹上岛」。观察灵动岛紧凑态和长按后的展开态；锁屏上也应显示小螃蟹。回到 App 点击「收回小螃蟹」，确认实时活动消失。

如只看到 App、没有灵动岛或锁屏内容，请先在 iPhone 的 App 设置中确认「实时活动」已开启，再把 Sideloadly 安装日志和 iOS 提示发给 Codex。这个路径尚未完成真机验证，尤其需要确认免费签名能保留 Widget Extension。

免费 Apple ID 的开发安装凭证通常 7 天到期；届时需要重新签名安装。Sideloadly 提供自动续签功能，但能否正常自动完成取决于它的设置和电脑与手机的连接情况。

## 工程内容

- `CrabApp/`：App 按钮与实时活动的启动、结束。
- `CrabWidget/`：灵动岛和锁屏画面；`Fonts/` 中有 19 套生成字体。
- `Shared/`：两个 target 共用的实时活动数据结构。
- `vendor/clawd-icons/`：原素材、生成工具与许可文件；不需要在你的 Windows 电脑重新生成字体。
- `project.yml`：XcodeGen 工程配置。
- `.github/workflows/build-ios.yml`：远程编译和 IPA 打包。
