Require Import ZArith.

Open Scope Z_scope.

Definition reg := nat.

Definition mkReg (n : nat) : reg := n.

Inductive instr : Set :=
| Movqrm : reg -> reg -> instr
| Movqmr : reg -> reg -> instr
| addq : reg -> reg -> instr
| subq : reg -> reg -> instr
| Leaq : Z -> reg -> reg -> instr
| Push : reg -> instr
| Pop : reg -> instr
| Ret : instr.

Extraction Language Haskell.

Extract Inductive Z => "Int" ["0" "fail" "fail"].
Extract Inductive nat => "Int" ["0" "(fun x -> x + 1)"].

Extraction "X86.hs" reg mkReg instr.