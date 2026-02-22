# O3 Client Outline — How to use

- Folder: tools/O3_ClientOutline
- Template file: O3_ClientOutlineTemplate.md

Instructions:

1. Copy the text from your Google Doc (open your doc, Select All → Copy) and paste the content into a new file based on `O3_ClientOutlineTemplate.md`.
   - Replace the placeholders (Team name, problem statement, etc.) with your content.
2. Save your finished markdown as `O3_Team.md` in this folder.
3. Compile to PDF using pandoc locally (requires pandoc + LaTeX):

```bash
pandoc O3_Team.md -o O3_Team.pdf --pdf-engine=xelatex -V geometry:margin=1in -V fontsize:11pt
```

Notes about Page limits and formatting:
- Page 1 must be at most one page; use the template structure and 11-pt font.
- Page 2 may contain only references and/or a single figure (one-line caption).
