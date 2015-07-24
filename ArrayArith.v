Require Import X86_64.
Require Import FSets.FMapInterface.
Require Export FMapAVL.
Require Export Coq.Structures.OrderedTypeEx.
Require Import List.

Definition arg := nat.
Definition stackLoc := nat.

Inductive array : Set :=
| RegArray : arg -> nat -> array
| StackArray : stackLoc -> nat -> array.

Inductive arrayAccess : Set :=
| Acc : array -> nat -> arrayAccess.

Inductive binop : Set :=
| Plus : binop
| Minus : binop.

Inductive arrayArithExpr : Set :=
| ArrBinop : binop -> arrayAccess -> arrayAccess -> arrayArithExpr.

Inductive arrayArithStmt : Set :=
| ArrStmt : arrayAccess -> arrayArithExpr -> arrayArithStmt.


Inductive x86CodeGenState : Set :=
| X86CGS : nat -> (stackLoc -> nat) -> list instr -> x86CodeGenState.

Module M := FMapAVL.Make(Nat_as_OT).

Definition map_nat_nat: Type := M.t nat.

Definition find k (m: map_nat_nat) := M.find k m.

Definition update (p: nat * nat) (m: map_nat_nat) :=
  M.add (fst p) (snd p) m.

Definition newX86CGS := X86CGS 8 map_nat_nat nil.