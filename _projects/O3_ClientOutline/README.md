# O3 Client Outline — How to use

- Folder: _projects/O3_ClientOutline
- Template file: O3_ClientOutlineTemplate.md

Instructions:

1. Copy the text from your Google Doc (open your doc, Select All → Copy) and paste the content into a new file based on `O3_ClientOutlineTemplate.md`.
   - Replace the placeholders (Team name, problem statement, etc.) with your content.
2. Save your finished markdown as `O3_Team.md` in this folder.
3. Compile to PDF using the included script or the pandoc command below.

Recommended pandoc command (requires pandoc + a LaTeX engine, e.g., texlive):

```bash
pandoc O3_Team.md -o O3_Team.pdf --pdf-engine=xelatex -V geometry:margin=1in -V fontsize:11pt
```

Or run the script:

```bash
./compile.sh O3_Team.md O3_Team.pdf
```

Notes about Page limits and formatting:
- Page 1 must be at most one page; use the template structure and 11-pt font.
- Page 2 may contain only references and/or a single figure (one-line caption).

If you already have a Google Doc PDF and want to include it in the repo unchanged, place the PDF here (e.g., `O3_Team_existing.pdf`) and we can keep it in the folder. But to match the course PDF constraints (font size, margins, single-page requirement), paste your text into the markdown template and compile.
