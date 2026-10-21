//  自动生成：tools/fonts.py —— 别手改。
//  每层一套字体（数字 0–9 = 十个字形），phase = 这层计时器的起点晚几秒（0 / 0.25 / 0.5 / 0.75）。
//  叠的顺序就是数组顺序：慢层 → 快层 → 黑蒙版。一格 = 10 单位，1 em = 100 格。

//  kind：0 慢层 / 1 快层 / 2 黑蒙版。锁屏（液态玻璃底）只用 phase 0 且不是蒙版的层：一秒一换、不留残影。
struct CrabLayer2 { let font: String; let color: UInt32; let phase: Double; let kind: Int }
struct CrabState2 { let w: Int; let h: Int; let layers: [CrabLayer2] }

let CRAB_STATES_2: [String: CrabState2] = [
    "在钓鱼": CrabState2(w: 137, h: 96, layers: [
        CrabLayer2(font: "XF0100", color: 0x000000, phase: 0.0, kind: 0),
        CrabLayer2(font: "XF0101", color: 0xDE886D, phase: 0.0, kind: 0),
        CrabLayer2(font: "XF0102", color: 0xA85A3A, phase: 0.0, kind: 0),
        CrabLayer2(font: "XF0103", color: 0xFFFFFF, phase: 0.0, kind: 0),
        CrabLayer2(font: "XF0104", color: 0xFF5365, phase: 0.0, kind: 0),
        CrabLayer2(font: "XF0105", color: 0x7FD1E8, phase: 0.0, kind: 0),
        CrabLayer2(font: "XF0106", color: 0x2E7AA8, phase: 0.0, kind: 0),
        CrabLayer2(font: "XF0107", color: 0xFFFFFF, phase: 0.0, kind: 1),
        CrabLayer2(font: "XF0108", color: 0xFFFFFF, phase: 0.25, kind: 1),
        CrabLayer2(font: "XF0109", color: 0xFFFFFF, phase: 0.5, kind: 1),
        CrabLayer2(font: "XF0110", color: 0xFFFFFF, phase: 0.75, kind: 1),
        CrabLayer2(font: "XF0111", color: 0x7FD1E8, phase: 0.0, kind: 1),
        CrabLayer2(font: "XF0112", color: 0x7FD1E8, phase: 0.25, kind: 1),
        CrabLayer2(font: "XF0113", color: 0x7FD1E8, phase: 0.5, kind: 1),
        CrabLayer2(font: "XF0114", color: 0x7FD1E8, phase: 0.75, kind: 1),
        CrabLayer2(font: "XF0115", color: 0x000000, phase: 0.0, kind: 2),
        CrabLayer2(font: "XF0116", color: 0x000000, phase: 0.25, kind: 2),
        CrabLayer2(font: "XF0117", color: 0x000000, phase: 0.5, kind: 2),
        CrabLayer2(font: "XF0118", color: 0x000000, phase: 0.75, kind: 2)]),
]

let CRAB_FONT_FILES_2: [String] = ["XF0100.ttf", "XF0101.ttf", "XF0102.ttf", "XF0103.ttf", "XF0104.ttf", "XF0105.ttf", "XF0106.ttf", "XF0107.ttf", "XF0108.ttf", "XF0109.ttf", "XF0110.ttf", "XF0111.ttf", "XF0112.ttf", "XF0113.ttf", "XF0114.ttf", "XF0115.ttf", "XF0116.ttf", "XF0117.ttf", "XF0118.ttf"]
