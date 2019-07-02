## OCaml の勉強用リポジトリ

### テキスト

[「プログラミングの基礎」](http://pllab.is.ocha.ac.jp/~asai/book/Top.html)

### 環境構築

```sh
brew install ocaml
brew install opam
brew install hg
brew install darcs
brew install rlwrap

echo "alias ocaml='rlwrap ocaml'" >> ~/.zshrc

opam init
eval $(opam env)
opam install merlin
opam user-setup install
eval `opam config env`

code --install-extension freebroccolo.reasonml
```

### REPL

```sh
% ocaml
        OCaml version 4.07.1

# exit 0 ;;
```

### 参考

- [opam \- opam](https://opam.ocaml.org/)
- [reasonml\-editor/vscode\-reasonml: OCaml & Reason support for Visual Studio Code](https://github.com/reasonml-editor/vscode-reasonml)
- [opam \- ocaml command line cannot find “topfind” \- Stack Overflow](https://stackoverflow.com/questions/47508389/ocaml-command-line-cannot-find-topfind)
