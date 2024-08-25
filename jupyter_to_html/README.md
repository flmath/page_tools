## Help tool to creating html pages from jupyter notebooks
0. You need anaconda and pretty_jupyter and jq (linux json tool) installed.
1. Make notebook ntbook.ipynb and transfer it to subdirectory notebooks
2. Choose title
3. ./remove_range.sh ntbook "title" "leave_latex"
or if your page do not need latex
   ./remove_range.sh ntbook "title"
4. In directory outputs there wil be new folder ntbook move it to flmath.github.io/src/routes/posts/jupyter
5. In flmath.github.io/src/routes/posts/PostList.ts add to items
  new Item("Title", "tags", "jupyter/ntbook"),
6. test with npm run dev -- --open 
7. git push and github actions should automaticly regenerate page