#!/usr/bin/env python3
"""Check the adaptation and launcher without modifying a learner's progress."""
import json
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parents[1]


def launch(root, *args, success=True):
    result = subprocess.run([sys.executable, str(root / "learn"), *args],
                            cwd=root, text=True, capture_output=True)
    assert (result.returncode == 0) == success, result.stderr
    return result.stdout


def main():
    lessons = sorted((ROOT / "lessons").glob("*.md"))
    assert len(lessons) == 31
    for source in lessons:
        assert source.read_bytes() == (ROOT / "course-website/lessons" / source.name).read_bytes(), source
        assert "Local edition for Billy" in source.read_text(), source
    for source in [ROOT / "README.md", *lessons]:
        for destination in re.findall(r"\]\(([^)]+)\)", source.read_text()):
            parsed = urlsplit(destination)
            if not parsed.scheme and not parsed.netloc and parsed.path:
                assert (source.parent / unquote(parsed.path)).is_file(), (source, destination)
    forbidden = re.compile(r"curl\s+|:PlugInstall|nnoremap\s+|mv\s+.*vimrc")
    assert not any(forbidden.search(p.read_text()) for p in lessons)
    assert (ROOT / ".practice/navigation/src/sockets.c").is_file()
    assert sum("SOCKET_OPEN" in p.read_text() for p in (ROOT / ".practice/navigation/src").glob("*.c")) >= 2
    print("PASS: 31 synchronized lessons, local links, updated instructions and navigation fixtures")

    with tempfile.TemporaryDirectory(prefix="vim learning check ") as folder:
        temp = Path(folder).resolve()
        shutil.copy2(ROOT / "learn", temp / "learn")
        shutil.copytree(ROOT / "lessons", temp / "lessons")
        shutil.copytree(ROOT / ".learning", temp / ".learning")
        shutil.copy2(ROOT / "README.md", temp / "README.md")
        listing = launch(temp, "list").splitlines()
        assert len(listing) == 31 and listing[0].startswith("intro ")
        for number in [*map(str, range(7)), "js"]:
            info = json.loads(launch(temp, number, "--print"))
            target = Path(info["argv"][-1])
            assert target.is_file() and target.parent == temp / ".practice"
            original = target.read_bytes()
            target.write_text("Learner progress\n")
            launch(temp, number, "--print")
            assert target.read_text() == "Learner progress\n"
            launch(temp, "reset", number, "--print")
            assert target.read_bytes() == original
            assert any(p.read_text() == "Learner progress\n" for p in (temp / ".practice/backups").glob(target.name + ".*"))
            assert "lua dofile(" in info["argv"][2] and " " in info["argv"][2]
        plugin = Path(json.loads(launch(temp, "plugin", "--print"))["argv"][-1])
        plugin.write_text("-- My plugin edits\n")
        launch(temp, "plugin", "--print")
        assert plugin.read_text() == "-- My plugin edits\n"
        launch(temp, "lesson", "../README", "--print", success=False)
        launch(temp, "reset", "--print", success=False)
        launch(temp, "nav", "--print", success=False)
        launch(temp, "0", "extra", "--print", success=False)
    print("PASS: all eight practice copies retain progress; resets back up edits; plugin edits and path safety preserved")


if __name__ == "__main__":
    main()
