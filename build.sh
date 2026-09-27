#!/usr/bin/env bash
# =====================================================================
#  build.sh —— 编译 paper.tex（xelatex + bibtex，4 遍收敛）
#  用法：
#     bash build.sh                  # 用系统 PATH 里的 xelatex
#     XELATEX=/path/to/xelatex bash build.sh
# =====================================================================
set -e

cd "$(dirname "$0")"

XELATEX="${XELATEX:-xelatex}"
BIBTEX="${BIBTEX:-bibtex}"

echo "==> 编译器：$XELATEX"
"$XELATEX" --version | head -1

echo "==> [1/4] xelatex (首遍，生成 .aux)"
"$XELATEX" --enable-installer --interaction=nonstopmode --halt-on-error paper.tex

echo "==> [2/4] bibtex (处理 references.bib)"
"$BIBTEX" paper

echo "==> [3/4] xelatex (第二遍，注入参考文献)"
"$XELATEX" --enable-installer --interaction=nonstopmode --halt-on-error paper.tex

echo "==> [4/4] xelatex (第三遍，收敛交叉引用)"
"$XELATEX" --enable-installer --interaction=nonstopmode --halt-on-error paper.tex

echo "==> 完成：paper.pdf"
ls -la paper.pdf
