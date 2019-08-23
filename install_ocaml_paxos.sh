apt update; apt install -y \
  opam \
  capnproto \
  libcapnp-dev \
  libgmp-dev

opam init -a && opam switch 4.07.0

opam install -y dune ounit core yojson uri capnp-rpc-lwt capnp-rpc-unix ocaml-protoc zmq-lwt lwt_ppx utop
