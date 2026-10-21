"""Check that the generated fonts and the Widget target stay in sync."""

from pathlib import Path
import re

root = Path(__file__).resolve().parents[1]
generated = (root / "CrabWidget/CrabStates2.swift").read_text(encoding="utf-8")
example = (root / "CrabWidget/CrabFrames.swift").read_text(encoding="utf-8")
project = (root / "project.yml").read_text(encoding="utf-8")

file_list = re.search(r"let CRAB_FONT_FILES_2: \[String\] = \[(.*?)\]", generated)
assert file_list is not None, "Generated Swift font manifest missing"
expected = set(re.findall(r'"(XF\d+\.ttf)"', file_list.group(1)))
on_disk = {path.name for path in (root / "CrabWidget/Fonts").glob("*.ttf")}
in_plist = set(re.findall(r"^\s+- (XF\d+\.ttf)$", project, re.MULTILINE))

assert len(expected) == 19, f"Expected 19 fish layers, got {len(expected)}"
assert expected == on_disk, f"Font files differ: expected {expected}, found {on_disk}"
assert expected == in_plist, f"UIAppFonts differs: expected {expected}, found {in_plist}"
assert '"在钓鱼": CrabState2' in generated, "Fish state missing"
assert not re.search(r"^struct Crab(Layer|State)2\b", example, re.MULTILINE), (
    "CrabFrames duplicates types from CrabStates2"
)
assert "NSSupportsLiveActivities: true" in project
assert "com.apple.widgetkit-extension" in project
assert "destination: plugins" in project

print("Asset check passed: 19 fonts, Swift state, Widget plist and embedding match")
