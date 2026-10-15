#!/usr/bin/env bash
# Compiles a .tex file to PDF with a fixed SOURCE_DATE_EPOCH, so the output
# PDF is byte-identical no matter who compiles it or when (same .tex input +
# same pinned TeX Live version -> same bytes, not just the same rendered
# content). Without this, xelatex embeds the actual compile timestamp in the
# PDF, so a local preview compile and CI's compile of the same commit always
# look "different," which is what caused local commits and CI's auto-commits
# to diverge and conflict.
#
# Usage: .github/scripts/compile.sh travis_resume.tex
set -euo pipefail

export SOURCE_DATE_EPOCH=1700000000

xelatex -interaction=nonstopmode "$1"
xelatex -interaction=nonstopmode "$1"
