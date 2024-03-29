## 本を読んで勉強

### テキスト

[「プログラミングの基礎」](http://pllab.is.ocha.ac.jp/~asai/book/Top.html)

### 環境構築

```sh
# Mac
brew install ocaml
brew install opam
brew install hg
brew install darcs
brew install rlwrap

echo "alias ocaml='rlwrap ocaml'" >> ~/.zshrc
echo "alias o='ocaml'" >> ~/.zshrc

opam init
eval $(opam env)
opam install merlin
opam user-setup install
eval `opam config env`

# VSCode
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
