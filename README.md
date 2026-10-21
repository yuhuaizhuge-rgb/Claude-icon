# 小螃蟹 iPhone 实时活动

第一阶段只接入「在钓鱼」一只小螃蟹。打开 App 点击「让螃蟹上岛」启动本地实时活动；点击「收回小螃蟹」结束它。灵动岛和锁屏由同一个 Widget Extension 显示，不使用推送。

工程采用 [XcodeGen](https://github.com/yonaskolb/XcodeGen)；`project.yml` 是工程配置，`.github/workflows/build-ios.yml` 在 GitHub 的 Mac 上编译未签名 IPA。本项目仍需真机签名安装和验证。中文步骤见 [README_使用说明.md](README_使用说明.md)。

钓鱼螃蟹的原始 SVG、转换工具和 Swift 示例来自 [TangfanOVO/clawd-icons](https://github.com/TangfanOVO/clawd-icons)。生成的字体也由该素材制成。原项目 MIT 许可和上游署名保存在 `vendor/clawd-icons/`，其中包括 `LICENSE`、`LICENSE.from-clawd-tank.txt` 和 `THIRD_PARTY.md`。
