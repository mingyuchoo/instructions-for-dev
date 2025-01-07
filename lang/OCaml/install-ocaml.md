# README

## Install OCaml

```bash
$ bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
$ opam init
$ eval $(opam env)
$ opam install ocaml-lsp-server odoc ocamlformat utop
```

## Install the Dune build system

```bash
opam install dune ocaml-lsp-server ocamlformat odoc top
opam install menhir mirage
```

- dune: OCaml 프로젝트의 빌드 시스템입니다.
- menhir: OCaml에서 사용하는 파서 생성기입니다.
- merlin: OCaml 코드에 대한 강력한 편집기 지원을 제공하는 도구입니다.
- mirage: OCaml을 기반으로 하는 unikernel 시스템입니다.
- ocaml-lsp-server: OCaml 언어 서버 프로토콜(LSP) 서버입니다.
- ocamlformat: OCaml 코드의 자동 코드 포매터입니다.
- odoc: OCaml 코드의 문서를 생성하는 도구입니다.
- opam: OCaml 패키지 관리자입니다.
- utop: OCaml의 상호작용적 최상위(top-level) 인터프리터입니다.

## Quickstart an OCaml app project using Dune

```bash
$ opam --version
$ dune init project project_name
$ cd project_name
$ dune build
$ dune exec ./bin/main.exe
```
#### From initializing to executing an executable

```bash
opam --version
opam exec -- dune init project {project_name}
cd {project_name}
opam exec -- dune clean
opam exec -- dune build @fmt
opam exec -- dune build @doc
opam exec -- dune build
opam exec -- dune test
opam exec -- dune exec $(basename ${PWD})
```
