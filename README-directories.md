This file describes the directory structure of this repository:

- `codes/`: PDFs of codes which are not freely accessible in Google Books, Hathi Trust, etc.
- `pdf/`: PDFs of codes cropped and limited to the relevant sections to be OCRed.
- `temp/`: Burst PDFs, individual page OCR text files, etc.
- `text/`: Text files of OCRed codes prior to being clean up.
- `legal-codes`: The codes after being cleaned up and as used in analysis.

The `Makefile` follows this same pathway, moving built artifacts from PDFs to the cleaned up texts.
