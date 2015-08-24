@initialize:ocaml@
@@

let tbl = Hashtbl.create 101

@main@
identifier str,i,prb,probe;
position p;
@@

struct str i = { .probe = prb@p, };

@call exists@
identifier f =~ "^devm";
identifier main.prb;
@@

prb(...) { <+... f(...) ...+> }

@script:ocaml@
prb << main.prb;
f << call.f;
i << main.i;
probe << main.probe;
@@

let entry = (i,probe) in
if not (Hashtbl.mem tbl entry)
then Hashtbl.add tbl entry (prb,f)

@finalize:ocaml@
@@

let lines =
  Hashtbl.fold
    (fun (i,probe) (prb,f) rest -> ((i,probe), (prb,f)) :: rest)
    tbl [] in
let lines = List.sort compare lines in
List.iter
  (function ((i,probe), (prb,f)) ->
    Printf.printf "struct %s field %s, example: %s, %s\n" i probe prb f)
  lines
      
