#!/bin/bash

# This script generate the documentation in PDF format using docutils.

# Convert RST to LaTeX
rst2latex --table-style=booktabs \
          --documentoptions=letterpaper,10pt \
          --stylesheet=mhscd-dataset-doc.sty \
          --syntax-highlight short \
          mhscd-dataset-doc.rst \
          mhscd-dataset-doc.tex

# LaTeX compilation (3 times to get references right)
pdflatex mhscd-dataset-doc.tex
pdflatex mhscd-dataset-doc.tex
pdflatex mhscd-dataset-doc.tex

# Remove LaTeX intermediate files
rm -f mhscd-dataset-doc.aux \
      mhscd-dataset-doc.log \
      mhscd-dataset-doc.out \
      mhscd-dataset-doc.tex \
      mhscd-dataset-doc.toc
