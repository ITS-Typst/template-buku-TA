"""
compile.py
Compile main.typ dan rename output PDF sesuai metadata data.yaml.
Usage: python compile.py
"""

import subprocess
import sys
import yaml
from pathlib import Path

data = yaml.safe_load(Path("data.yaml").read_text(encoding="utf-8"))
nrp  = data["mahasiswa"]["nrp"]
nama = data["mahasiswa"]["nama"]

out = Path(f"LAPORAN TA - {nrp} - {nama}.pdf")

result = subprocess.run(["typst", "compile", "main.typ", str(out)])
if result.returncode == 0:
    print(f"[OK] {out}")
else:
    sys.exit(result.returncode)
