#### make

```sh
cd src/chapter19
make top
ocamldep tree.mli > ._bcdi/tree.di
ocamldep tree.ml > ._d/tree.d
ocamlc -c tree.mli
ocamlc -c tree.ml
ocamlmktop \
                                  \
                                               -o my-tree.top \
                                tree.cmo
```

#### run

```sh
./my-tree.top
        OCaml version 4.07.1

Cannot find file topfind.
# Tree.empty;;
- : ('a, 'b) Tree.t = <abstr>
```
