/*
   Automatically created via translation of a Dash model to Alloy
   on 2023-09-16 13:40:55
*/

open util/boolean
open util/traces[DshSnapshot] as DshSnapshot
abstract sig DshStates {}
abstract sig Root extends DshStates {} 
abstract sig DshScopes {}
one sig RootScope extends DshScopes {} 
one sig Root_AScope extends DshScopes {} 
abstract sig Root_A extends Root {} 
one sig Root_A_A1 extends Root_A {} 
one sig Root_A_A2 extends Root_A {} 
one sig Root_BScope extends DshScopes {} 
abstract sig Root_B extends Root {} 
one sig Root_B_B1 extends Root_B {} 
one sig Root_B_B2 extends Root_B {} 
one sig Root_C extends Root {} 

abstract sig Transitions {}
one sig NO_TRANS extends Transitions {} 
one sig Root_A_A1_t1 extends Transitions {} 
one sig Root_A_A2_t2 extends Transitions {} 
one sig Root_B_B1_t3 extends Transitions {} 
one sig Root_B_B2_t4 extends Transitions {} 

sig DshSnapshot {
  dsh_sc_used0: set DshScopes,
  dsh_conf0: set DshStates,
  dsh_taken0: set Transitions,
  dsh_stable: one boolean/Bool
}

pred dsh_initial [
	s: one DshSnapshot] {
  ((s.dsh_conf0) = (Root_A_A1 + Root_B_B1)) &&
  ((s.dsh_sc_used0) = none) &&
  ((s.dsh_taken0) = NO_TRANS)
  (s.dsh_stable).boolean/isTrue
}

pred Root_A_A1_t1_pre [
	s: one DshSnapshot] {
  some (Root_A_A1 & (s.dsh_conf0))
  !(RootScope in (s.dsh_sc_used0))
  !(Root_AScope in (s.dsh_sc_used0))
}


pred Root_A_A1_t1_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - (Root_A_A1 + Root_A_A2)) + Root_A_A2)
  (sn.dsh_taken0) = Root_A_A1_t1
  {(Root_A.(sn.(s._nextIsStable)))=>
    (((sn.dsh_stable).boolean/isTrue) &&
       ((sn.dsh_sc_used0) = none) &&
       ({ ((s.dsh_stable).boolean/isTrue) ||
            (!((s.dsh_stable).boolean/isTrue)) }))
  else
    (((sn.dsh_stable).boolean/isFalse) &&
       ({((s.dsh_stable).boolean/isTrue)=>
            ((sn.dsh_sc_used0) = none)
          else
            ((sn.dsh_sc_used0) =
               ((s.dsh_sc_used0) + Root_AScope))}
        ))}

}

pred Root_A_A1_t1_enabledAfterStep [
	s: one DshSnapshot,
	sn: one DshSnapshot,
	sc0: DshStates] {
  some (Root_A_A1 & (sn.dsh_conf0))
  { (((s.dsh_stable).boolean/isTrue) &&
     (!(Root in sc0)) &&
     (!(Root_A in sc0))) ||
    (!((s.dsh_stable).boolean/isTrue)) }
}

pred Root_A_A1_t1 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_A1_t1_pre
  sn.(s.Root_A_A1_t1_post)
}

pred Root_A_A2_t2_pre [
	s: one DshSnapshot] {
  some (Root_A_A2 & (s.dsh_conf0))
  !(RootScope in (s.dsh_sc_used0))
}


pred Root_A_A2_t2_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      ((((Root_A_A1 + Root_A_A2) + Root_B_B1) + Root_B_B2) +
         Root_C)) + Root_C)
  (sn.dsh_taken0) = Root_A_A2_t2
  {(Root.(sn.(s._nextIsStable)))=>
    (((sn.dsh_stable).boolean/isTrue) &&
       ((sn.dsh_sc_used0) = none) &&
       ({ ((s.dsh_stable).boolean/isTrue) ||
            (!((s.dsh_stable).boolean/isTrue)) }))
  else
    (((sn.dsh_stable).boolean/isFalse) &&
       ({((s.dsh_stable).boolean/isTrue)=>
            ((sn.dsh_sc_used0) = none)
          else
            ((sn.dsh_sc_used0) =
               ((s.dsh_sc_used0) + RootScope))}
        ))}

}

pred Root_A_A2_t2_enabledAfterStep [
	s: one DshSnapshot,
	sn: one DshSnapshot,
	sc0: DshStates] {
  some (Root_A_A2 & (sn.dsh_conf0))
  { (((s.dsh_stable).boolean/isTrue) && (!(Root in sc0))) ||
    (!((s.dsh_stable).boolean/isTrue)) }
}

pred Root_A_A2_t2 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_A2_t2_pre
  sn.(s.Root_A_A2_t2_post)
}

pred Root_B_B1_t3_pre [
	s: one DshSnapshot] {
  some (Root_B_B1 & (s.dsh_conf0))
  !(RootScope in (s.dsh_sc_used0))
  !(Root_BScope in (s.dsh_sc_used0))
}


pred Root_B_B1_t3_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - (Root_B_B1 + Root_B_B2)) + Root_B_B2)
  (sn.dsh_taken0) = Root_B_B1_t3
  {(Root_B.(sn.(s._nextIsStable)))=>
    (((sn.dsh_stable).boolean/isTrue) &&
       ((sn.dsh_sc_used0) = none) &&
       ({ ((s.dsh_stable).boolean/isTrue) ||
            (!((s.dsh_stable).boolean/isTrue)) }))
  else
    (((sn.dsh_stable).boolean/isFalse) &&
       ({((s.dsh_stable).boolean/isTrue)=>
            ((sn.dsh_sc_used0) = none)
          else
            ((sn.dsh_sc_used0) =
               ((s.dsh_sc_used0) + Root_BScope))}
        ))}

}

pred Root_B_B1_t3_enabledAfterStep [
	s: one DshSnapshot,
	sn: one DshSnapshot,
	sc0: DshStates] {
  some (Root_B_B1 & (sn.dsh_conf0))
  { (((s.dsh_stable).boolean/isTrue) &&
     (!(Root in sc0)) &&
     (!(Root_B in sc0))) ||
    (!((s.dsh_stable).boolean/isTrue)) }
}

pred Root_B_B1_t3 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_B1_t3_pre
  sn.(s.Root_B_B1_t3_post)
}

pred Root_B_B2_t4_pre [
	s: one DshSnapshot] {
  some (Root_B_B2 & (s.dsh_conf0))
  !(RootScope in (s.dsh_sc_used0))
}


pred Root_B_B2_t4_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      ((((Root_A_A1 + Root_A_A2) + Root_B_B1) + Root_B_B2) +
         Root_C)) + Root_C)
  (sn.dsh_taken0) = Root_B_B2_t4
  {(Root.(sn.(s._nextIsStable)))=>
    (((sn.dsh_stable).boolean/isTrue) &&
       ((sn.dsh_sc_used0) = none) &&
       ({ ((s.dsh_stable).boolean/isTrue) ||
            (!((s.dsh_stable).boolean/isTrue)) }))
  else
    (((sn.dsh_stable).boolean/isFalse) &&
       ({((s.dsh_stable).boolean/isTrue)=>
            ((sn.dsh_sc_used0) = none)
          else
            ((sn.dsh_sc_used0) =
               ((s.dsh_sc_used0) + RootScope))}
        ))}

}

pred Root_B_B2_t4_enabledAfterStep [
	s: one DshSnapshot,
	sn: one DshSnapshot,
	sc0: DshStates] {
  some (Root_B_B2 & (sn.dsh_conf0))
  { (((s.dsh_stable).boolean/isTrue) && (!(Root in sc0))) ||
    (!((s.dsh_stable).boolean/isTrue)) }
}

pred Root_B_B2_t4 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_B2_t4_pre
  sn.(s.Root_B_B2_t4_post)
}

pred _nextIsStable [
	s: one DshSnapshot,
	sn: one DshSnapshot,
	sc0: DshStates] {
  !(sc0.(sn.(s.Root_A_A1_t1_enabledAfterStep)))
  !(sc0.(sn.(s.Root_A_A2_t2_enabledAfterStep)))
  !(sc0.(sn.(s.Root_B_B1_t3_enabledAfterStep)))
  !(sc0.(sn.(s.Root_B_B2_t4_enabledAfterStep)))
}

pred dsh_small_step [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  { (sn.(s.Root_A_A1_t1)) ||
    (sn.(s.Root_A_A2_t2)) ||
    (sn.(s.Root_B_B1_t3)) ||
    (sn.(s.Root_B_B2_t4)) ||
    ((!({ (s.Root_A_A1_t1_pre) ||
            (s.Root_A_A2_t2_pre) ||
            (s.Root_B_B1_t3_pre) ||
            (s.Root_B_B2_t4_pre) })) &&
       (sn.(s.dsh_stutter))) }
}

pred dsh_stutter [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_stable) = (s.dsh_stable)
  (sn.dsh_conf0) = (s.dsh_conf0)
  (sn.dsh_sc_used0) = (s.dsh_sc_used0)
  (sn.dsh_taken0) = NO_TRANS
}

fact allSnapshotsDifferent {
  (all s: one
  DshSnapshot,sn: one
  DshSnapshot | (((s.dsh_conf0) = (sn.dsh_conf0)) &&
                   ((s.dsh_sc_used0) = (sn.dsh_sc_used0)) &&
                   ((s.dsh_taken0) = (sn.dsh_taken0)) &&
                   ((s.dsh_stable) = (sn.dsh_stable))) =>
                  (s = sn))
}

pred dsh_enough_operations {
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_A_A1_t1))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_A_A2_t2))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_B_B1_t3))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_B_B2_t4))
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

pred trace_pred [
s1: one DshSnapshot,
s2: one DshSnapshot,
s3: one DshSnapshot,
s4: one DshSnapshot] {
s1 = DshSnapshot/first &&
s2 = s1.DshSnapshot/next &&
s3 = s2.DshSnapshot/next &&
s4 = s3.DshSnapshot/next &&
s1.dsh_conf0 = Root_A_A1 + Root_B_B1 &&
s2.dsh_conf0 = Root_A_A2 + Root_B_B1 &&
s3.dsh_conf0 = Root_A_A2 + Root_B_B2 &&
s4.dsh_conf0 = Root_C
}

run trace_pred for exactly 4 DshSnapshot
