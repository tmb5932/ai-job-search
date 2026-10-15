#!/usr/bin/env bash
# Generates web_resume.tex from travis_resume.tex by deleting the block
# marked with WEB-RESUME:REMOVE-START / WEB-RESUME:REMOVE-END (email + phone).
set -euo pipefail

cd "$(dirname "$0")/../.."

sed '/% WEB-RESUME:REMOVE-START/,/% WEB-RESUME:REMOVE-END/d' travis_resume.tex > web_resume.tex
