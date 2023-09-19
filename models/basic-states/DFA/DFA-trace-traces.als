/*
   Automatically created via translation of a Dash model to Alloy
   on 2023-09-09 11:50:17
*/

open util/boolean
open util/traces[DshSnapshot] as DshSnapshot

// DFA that accepts words which have an even number of A's and B's

abstract sig Alphabet {}
one sig A, B extends Alphabet {}

abstract sig DshStates {}
abstract sig DFA extends DshStates {} 
one sig DFA_S00 extends DFA {} 
one sig DFA_S01 extends DFA {} 
one sig DFA_S10 extends DFA {} 
one sig DFA_S11 extends DFA {} 

abstract sig Transitions {}
one sig NO_TRANS extends Transitions {} 
one sig DFA_S00_onB extends Transitions {} 
one sig DFA_S00_onA extends Transitions {} 
one sig DFA_S01_onA extends Transitions {} 
one sig DFA_S10_reject extends Transitions {} 
one sig DFA_S00_accept extends Transitions {} 
one sig DFA_S01_onB extends Transitions {} 
one sig DFA_S01_reject extends Transitions {} 
one sig DFA_S10_onA extends Transitions {} 
one sig DFA_S11_onA extends Transitions {} 
one sig DFA_S11_reject extends Transitions {} 
one sig DFA_S10_onB extends Transitions {} 
one sig DFA_S11_onB extends Transitions {} 

sig DshSnapshot {
  dsh_conf0: set DshStates,
  dsh_taken0: set Transitions,
  DFA_input: seq Alphabet,
  DFA_output: one Bool
}

pred dsh_initial [
	s: one DshSnapshot] {
  ((s.dsh_conf0) = DFA_S00) &&
  ((s.dsh_taken0) = NO_TRANS) &&
  ((s.DFA_output) = boolean/False) &&
  (!((s.DFA_input).isEmpty))
}

pred DFA_S00_onB_pre [
	s: one DshSnapshot] {
  some (DFA_S00 & (s.dsh_conf0))
  ((s.DFA_input).first) = B
}


pred DFA_S00_onB_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((DFA_S00 + DFA_S01) + DFA_S10) + DFA_S11)) + DFA_S01)
  (sn.DFA_input) = ((s.DFA_input).rest)
  (sn.dsh_taken0) = DFA_S00_onB
  (s.DFA_output) = (sn.DFA_output)
}

pred DFA_S00_onB [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.DFA_S00_onB_pre
  sn.(s.DFA_S00_onB_post)
}

pred DFA_S00_onA_pre [
	s: one DshSnapshot] {
  some (DFA_S00 & (s.dsh_conf0))
  ((s.DFA_input).first) = A
}


pred DFA_S00_onA_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((DFA_S00 + DFA_S01) + DFA_S10) + DFA_S11)) + DFA_S10)
  (sn.DFA_input) = ((s.DFA_input).rest)
  (sn.dsh_taken0) = DFA_S00_onA
  (s.DFA_output) = (sn.DFA_output)
}

pred DFA_S00_onA [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.DFA_S00_onA_pre
  sn.(s.DFA_S00_onA_post)
}

pred DFA_S01_onA_pre [
	s: one DshSnapshot] {
  some (DFA_S01 & (s.dsh_conf0))
  ((s.DFA_input).first) = A
}


pred DFA_S01_onA_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((DFA_S00 + DFA_S01) + DFA_S10) + DFA_S11)) + DFA_S11)
  (sn.DFA_input) = ((s.DFA_input).rest)
  (sn.dsh_taken0) = DFA_S01_onA
  (s.DFA_output) = (sn.DFA_output)
}

pred DFA_S01_onA [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.DFA_S01_onA_pre
  sn.(s.DFA_S01_onA_post)
}

pred DFA_S10_reject_pre [
	s: one DshSnapshot] {
  some (DFA_S10 & (s.dsh_conf0))
  (s.DFA_input).isEmpty
}


pred DFA_S10_reject_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) = (((s.dsh_conf0) - DFA_S10) + DFA_S10)
  (sn.DFA_output) = boolean/False
  (sn.dsh_taken0) = DFA_S10_reject
  (s.DFA_input) = (sn.DFA_input)
}

pred DFA_S10_reject [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.DFA_S10_reject_pre
  sn.(s.DFA_S10_reject_post)
}

pred DFA_S00_accept_pre [
	s: one DshSnapshot] {
  some (DFA_S00 & (s.dsh_conf0))
  (s.DFA_input).isEmpty
}


pred DFA_S00_accept_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) = (((s.dsh_conf0) - DFA_S00) + DFA_S00)
  (sn.DFA_output) = boolean/True
  (sn.dsh_taken0) = DFA_S00_accept
  (s.DFA_input) = (sn.DFA_input)
}

pred DFA_S00_accept [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.DFA_S00_accept_pre
  sn.(s.DFA_S00_accept_post)
}

pred DFA_S01_onB_pre [
	s: one DshSnapshot] {
  some (DFA_S01 & (s.dsh_conf0))
  ((s.DFA_input).first) = B
}


pred DFA_S01_onB_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((DFA_S00 + DFA_S01) + DFA_S10) + DFA_S11)) + DFA_S00)
  (sn.DFA_input) = ((s.DFA_input).rest)
  (sn.dsh_taken0) = DFA_S01_onB
  (s.DFA_output) = (sn.DFA_output)
}

pred DFA_S01_onB [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.DFA_S01_onB_pre
  sn.(s.DFA_S01_onB_post)
}

pred DFA_S01_reject_pre [
	s: one DshSnapshot] {
  some (DFA_S01 & (s.dsh_conf0))
  (s.DFA_input).isEmpty
}


pred DFA_S01_reject_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) = (((s.dsh_conf0) - DFA_S01) + DFA_S01)
  (sn.DFA_output) = boolean/False
  (sn.dsh_taken0) = DFA_S01_reject
  (s.DFA_input) = (sn.DFA_input)
}

pred DFA_S01_reject [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.DFA_S01_reject_pre
  sn.(s.DFA_S01_reject_post)
}

pred DFA_S10_onA_pre [
	s: one DshSnapshot] {
  some (DFA_S10 & (s.dsh_conf0))
  ((s.DFA_input).first) = A
}


pred DFA_S10_onA_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((DFA_S00 + DFA_S01) + DFA_S10) + DFA_S11)) + DFA_S00)
  (sn.DFA_input) = ((s.DFA_input).rest)
  (sn.dsh_taken0) = DFA_S10_onA
  (s.DFA_output) = (sn.DFA_output)
}

pred DFA_S10_onA [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.DFA_S10_onA_pre
  sn.(s.DFA_S10_onA_post)
}

pred DFA_S11_onA_pre [
	s: one DshSnapshot] {
  some (DFA_S11 & (s.dsh_conf0))
  ((s.DFA_input).first) = A
}


pred DFA_S11_onA_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((DFA_S00 + DFA_S01) + DFA_S10) + DFA_S11)) + DFA_S01)
  (sn.DFA_input) = ((s.DFA_input).rest)
  (sn.dsh_taken0) = DFA_S11_onA
  (s.DFA_output) = (sn.DFA_output)
}

pred DFA_S11_onA [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.DFA_S11_onA_pre
  sn.(s.DFA_S11_onA_post)
}

pred DFA_S11_reject_pre [
	s: one DshSnapshot] {
  some (DFA_S11 & (s.dsh_conf0))
  (s.DFA_input).isEmpty
}


pred DFA_S11_reject_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) = (((s.dsh_conf0) - DFA_S11) + DFA_S11)
  (sn.DFA_output) = boolean/False
  (sn.dsh_taken0) = DFA_S11_reject
  (s.DFA_input) = (sn.DFA_input)
}

pred DFA_S11_reject [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.DFA_S11_reject_pre
  sn.(s.DFA_S11_reject_post)
}

pred DFA_S10_onB_pre [
	s: one DshSnapshot] {
  some (DFA_S10 & (s.dsh_conf0))
  ((s.DFA_input).first) = B
}


pred DFA_S10_onB_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((DFA_S00 + DFA_S01) + DFA_S10) + DFA_S11)) + DFA_S11)
  (sn.DFA_input) = ((s.DFA_input).rest)
  (sn.dsh_taken0) = DFA_S10_onB
  (s.DFA_output) = (sn.DFA_output)
}

pred DFA_S10_onB [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.DFA_S10_onB_pre
  sn.(s.DFA_S10_onB_post)
}

pred DFA_S11_onB_pre [
	s: one DshSnapshot] {
  some (DFA_S11 & (s.dsh_conf0))
  ((s.DFA_input).first) = B
}


pred DFA_S11_onB_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((DFA_S00 + DFA_S01) + DFA_S10) + DFA_S11)) + DFA_S10)
  (sn.DFA_input) = ((s.DFA_input).rest)
  (sn.dsh_taken0) = DFA_S11_onB
  (s.DFA_output) = (sn.DFA_output)
}

pred DFA_S11_onB [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.DFA_S11_onB_pre
  sn.(s.DFA_S11_onB_post)
}

pred dsh_small_step [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  { (sn.(s.DFA_S00_onB)) ||
    (sn.(s.DFA_S00_onA)) ||
    (sn.(s.DFA_S01_onA)) ||
    (sn.(s.DFA_S10_reject)) ||
    (sn.(s.DFA_S00_accept)) ||
    (sn.(s.DFA_S01_onB)) ||
    (sn.(s.DFA_S01_reject)) ||
    (sn.(s.DFA_S10_onA)) ||
    (sn.(s.DFA_S11_onA)) ||
    (sn.(s.DFA_S11_reject)) ||
    (sn.(s.DFA_S10_onB)) ||
    (sn.(s.DFA_S11_onB)) ||
    ((!({ (s.DFA_S00_onB_pre) ||
            (s.DFA_S00_onA_pre) ||
            (s.DFA_S01_onA_pre) ||
            (s.DFA_S10_reject_pre) ||
            (s.DFA_S00_accept_pre) ||
            (s.DFA_S01_onB_pre) ||
            (s.DFA_S01_reject_pre) ||
            (s.DFA_S10_onA_pre) ||
            (s.DFA_S11_onA_pre) ||
            (s.DFA_S11_reject_pre) ||
            (s.DFA_S10_onB_pre) ||
            (s.DFA_S11_onB_pre) })) &&
       (sn.(s.dsh_stutter))) }
}

pred dsh_stutter [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) = (s.dsh_conf0)
  (sn.dsh_taken0) = NO_TRANS
  (sn.DFA_input) = (s.DFA_input)
  (sn.DFA_output) = (s.DFA_output)
}

fact allSnapshotsDifferent {
  (all s: one
  DshSnapshot,sn: one
  DshSnapshot | (((s.dsh_conf0) = (sn.dsh_conf0)) &&
                   ((s.dsh_taken0) = (sn.dsh_taken0)) &&
                   ((s.DFA_input) = (sn.DFA_input)) &&
                   ((s.DFA_output) = (sn.DFA_output))) =>
                  (s = sn))
}

pred dsh_enough_operations {
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.DFA_S00_onB))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.DFA_S00_onA))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.DFA_S01_onA))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.DFA_S10_reject))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.DFA_S00_accept))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.DFA_S01_onB))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.DFA_S01_reject))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.DFA_S10_onA))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.DFA_S11_onA))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.DFA_S11_reject))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.DFA_S10_onB))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.DFA_S11_onB))
}

fact dsh_traces_fact {
  DshSnapshot/first.dsh_initial
  {(some
  DshSnapshot/back)=>
    ((all s: DshSnapshot | (s.DshSnapshot/next).(s.dsh_small_step)))
  else
    ((all s: one
    (DshSnapshot - DshSnapshot/last) | (s.DshSnapshot/next).(s.dsh_small_step)))}

}

pred dsh_strong_no_stutter {
  (all s: DshSnapshot | { (s = DshSnapshot/first) ||
                          (NO_TRANS !in (s.dsh_taken0)) })
}

pred evens[word: seq Alphabet] {
	(#(word :> A)).rem[2] = 0 
	(#(word :> B)).rem[2] = 0
}

check {
	evens[DshSnapshot/first.DFA_input] <=> isTrue[DshSnapshot/last.DFA_output]
}
for exactly 8 DshSnapshot


pred trace_pred [
s1: one DshSnapshot,
s2: one DshSnapshot,
s3: one DshSnapshot,
s4: one DshSnapshot,
s5: one DshSnapshot,
s6: one DshSnapshot] {
s1 = DshSnapshot/first &&
s2 = s1.DshSnapshot/next &&
s3 = s2.DshSnapshot/next &&
s4 = s3.DshSnapshot/next &&
s5 = s4.DshSnapshot/next &&
s6 = s5.DshSnapshot/next &&
s1.dsh_conf0 = DFA_S00 &&
s2.dsh_conf0 = DFA_S11 &&
s3.dsh_conf0 = DFA_S10 &&
s4.dsh_conf0 = DFA_S00 &&
s5.dsh_conf0 = DFA_S01 &&
s6.dsh_conf0 = DFA_S11}

run trace_pred for exactly 6 DshSnapshot
