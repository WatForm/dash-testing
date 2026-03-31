open util/traces [__Snapshot] as __Snapshot
    
open util/boolean 
    
abstract sig Alphabet {} 
    
one sig A extends Alphabet {} 
    
one sig B extends Alphabet {} 
    
abstract sig __States {} 
    
abstract sig DFA extends __States {} 
    
one sig DFA_S00 extends DFA {} 
    
one sig DFA_S01 extends DFA {} 
    
one sig DFA_S10 extends DFA {} 
    
one sig DFA_S11 extends DFA {} 
    
abstract sig Transitions {} 
    
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
    
sig __Snapshot {
    __conf0 : set __States,
    __taken0 : lone Transitions,
    DFA_input : set seq Alphabet,
    DFA_output : one Bool
} 
    
pred evens [
    word : set seq Alphabet
] {
    (#(word :> A)).rem[2] = 0
    
    (#(word :> B)).rem[2] = 0
}
    
pred __initial [
    s : one __Snapshot
] {
    s.__conf0 = DFA_S00
    
    s.__taken0 = none
    
    {
        s.DFA_output = boolean/False
        
        ! s.DFA_input.isEmpty
    }
}
    
pred DFA_S00_onB___pre [
    s : one __Snapshot
] {
    some DFA_S00 & s.__conf0
    
    first[s.DFA_input] = B
}
    
pred DFA_S00_onB___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0 - (DFA_S00 + DFA_S01 + DFA_S10 + DFA_S11) + DFA_S01
    
    sn.__taken0 = DFA_S00_onB
    
    sn.DFA_input = s.DFA_input.rest
    
    s.DFA_output = sn.DFA_output
}
    
pred DFA_S00_onB [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S00_onB___pre[s]
    
    DFA_S00_onB___post[s, sn]
}
    
pred DFA_S00_onA___pre [
    s : one __Snapshot
] {
    some DFA_S00 & s.__conf0
    
    first[s.DFA_input] = A
}
    
pred DFA_S00_onA___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0 - (DFA_S00 + DFA_S01 + DFA_S10 + DFA_S11) + DFA_S10
    
    sn.__taken0 = DFA_S00_onA
    
    sn.DFA_input = s.DFA_input.rest
    
    s.DFA_output = sn.DFA_output
}
    
pred DFA_S00_onA [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S00_onA___pre[s]
    
    DFA_S00_onA___post[s, sn]
}
    
pred DFA_S01_onA___pre [
    s : one __Snapshot
] {
    some DFA_S01 & s.__conf0
    
    first[s.DFA_input] = A
}
    
pred DFA_S01_onA___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0 - (DFA_S00 + DFA_S01 + DFA_S10 + DFA_S11) + DFA_S11
    
    sn.__taken0 = DFA_S01_onA
    
    sn.DFA_input = s.DFA_input.rest
    
    s.DFA_output = sn.DFA_output
}
    
pred DFA_S01_onA [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S01_onA___pre[s]
    
    DFA_S01_onA___post[s, sn]
}
    
pred DFA_S10_reject___pre [
    s : one __Snapshot
] {
    some DFA_S10 & s.__conf0
    
    s.DFA_input.isEmpty
}
    
pred DFA_S10_reject___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0 - DFA_S10 + DFA_S10
    
    sn.__taken0 = DFA_S10_reject
    
    sn.DFA_output = boolean/False
    
    s.DFA_input = sn.DFA_input
}
    
pred DFA_S10_reject [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S10_reject___pre[s]
    
    DFA_S10_reject___post[s, sn]
}
    
pred DFA_S00_accept___pre [
    s : one __Snapshot
] {
    some DFA_S00 & s.__conf0
    
    s.DFA_input.isEmpty
}
    
pred DFA_S00_accept___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0 - DFA_S00 + DFA_S00
    
    sn.__taken0 = DFA_S00_accept
    
    sn.DFA_output = boolean/True
    
    s.DFA_input = sn.DFA_input
}
    
pred DFA_S00_accept [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S00_accept___pre[s]
    
    DFA_S00_accept___post[s, sn]
}
    
pred DFA_S01_onB___pre [
    s : one __Snapshot
] {
    some DFA_S01 & s.__conf0
    
    first[s.DFA_input] = B
}
    
pred DFA_S01_onB___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0 - (DFA_S00 + DFA_S01 + DFA_S10 + DFA_S11) + DFA_S00
    
    sn.__taken0 = DFA_S01_onB
    
    sn.DFA_input = s.DFA_input.rest
    
    s.DFA_output = sn.DFA_output
}
    
pred DFA_S01_onB [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S01_onB___pre[s]
    
    DFA_S01_onB___post[s, sn]
}
    
pred DFA_S01_reject___pre [
    s : one __Snapshot
] {
    some DFA_S01 & s.__conf0
    
    s.DFA_input.isEmpty
}
    
pred DFA_S01_reject___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0 - DFA_S01 + DFA_S01
    
    sn.__taken0 = DFA_S01_reject
    
    sn.DFA_output = boolean/False
    
    s.DFA_input = sn.DFA_input
}
    
pred DFA_S01_reject [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S01_reject___pre[s]
    
    DFA_S01_reject___post[s, sn]
}
    
pred DFA_S10_onA___pre [
    s : one __Snapshot
] {
    some DFA_S10 & s.__conf0
    
    first[s.DFA_input] = A
}
    
pred DFA_S10_onA___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0 - (DFA_S00 + DFA_S01 + DFA_S10 + DFA_S11) + DFA_S00
    
    sn.__taken0 = DFA_S10_onA
    
    sn.DFA_input = s.DFA_input.rest
    
    s.DFA_output = sn.DFA_output
}
    
pred DFA_S10_onA [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S10_onA___pre[s]
    
    DFA_S10_onA___post[s, sn]
}
    
pred DFA_S11_onA___pre [
    s : one __Snapshot
] {
    some DFA_S11 & s.__conf0
    
    first[s.DFA_input] = A
}
    
pred DFA_S11_onA___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0 - (DFA_S00 + DFA_S01 + DFA_S10 + DFA_S11) + DFA_S01
    
    sn.__taken0 = DFA_S11_onA
    
    sn.DFA_input = s.DFA_input.rest
    
    s.DFA_output = sn.DFA_output
}
    
pred DFA_S11_onA [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S11_onA___pre[s]
    
    DFA_S11_onA___post[s, sn]
}
    
pred DFA_S11_reject___pre [
    s : one __Snapshot
] {
    some DFA_S11 & s.__conf0
    
    s.DFA_input.isEmpty
}
    
pred DFA_S11_reject___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0 - DFA_S11 + DFA_S11
    
    sn.__taken0 = DFA_S11_reject
    
    sn.DFA_output = boolean/False
    
    s.DFA_input = sn.DFA_input
}
    
pred DFA_S11_reject [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S11_reject___pre[s]
    
    DFA_S11_reject___post[s, sn]
}
    
pred DFA_S10_onB___pre [
    s : one __Snapshot
] {
    some DFA_S10 & s.__conf0
    
    first[s.DFA_input] = B
}
    
pred DFA_S10_onB___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0 - (DFA_S00 + DFA_S01 + DFA_S10 + DFA_S11) + DFA_S11
    
    sn.__taken0 = DFA_S10_onB
    
    sn.DFA_input = s.DFA_input.rest
    
    s.DFA_output = sn.DFA_output
}
    
pred DFA_S10_onB [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S10_onB___pre[s]
    
    DFA_S10_onB___post[s, sn]
}
    
pred DFA_S11_onB___pre [
    s : one __Snapshot
] {
    some DFA_S11 & s.__conf0
    
    first[s.DFA_input] = B
}
    
pred DFA_S11_onB___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0 - (DFA_S00 + DFA_S01 + DFA_S10 + DFA_S11) + DFA_S10
    
    sn.__taken0 = DFA_S11_onB
    
    sn.DFA_input = s.DFA_input.rest
    
    s.DFA_output = sn.DFA_output
}
    
pred DFA_S11_onB [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S11_onB___pre[s]
    
    DFA_S11_onB___post[s, sn]
}
    
pred __small_step [
    s : one __Snapshot, sn : one __Snapshot
] {
    DFA_S00_onB[s, sn] or DFA_S00_onA[s, sn] or DFA_S01_onA[s, sn] or
        DFA_S10_reject[s, sn] or
        DFA_S00_accept[s, sn] or
        DFA_S01_onB[s, sn] or
        DFA_S01_reject[s, sn] or
        DFA_S10_onA[s, sn] or
        DFA_S11_onA[s, sn] or
        DFA_S11_reject[s, sn] or
        DFA_S10_onB[s, sn] or
        DFA_S11_onB[s, sn] or
        ! (DFA_S00_onB___pre[s] or DFA_S00_onA___pre[s] or DFA_S01_onA___pre[s] or
               DFA_S10_reject___pre[s] or
               DFA_S00_accept___pre[s] or
               DFA_S01_onB___pre[s] or
               DFA_S01_reject___pre[s] or
               DFA_S10_onA___pre[s] or
               DFA_S11_onA___pre[s] or
               DFA_S11_reject___pre[s] or
               DFA_S10_onB___pre[s] or
            DFA_S11_onB___pre[s]) and
            __stutter[s, sn]
}
    
pred __stutter [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 = s.__conf0
    
    sn.__taken0 = none
    
    sn.DFA_input = s.DFA_input
    
    sn.DFA_output = s.DFA_output
}
    
pred __enough_ops {
    some s : one __Snapshot, sn : one __Snapshot | DFA_S00_onB[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot | DFA_S00_onA[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot | DFA_S01_onA[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot | DFA_S10_reject[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot | DFA_S00_accept[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot | DFA_S01_onB[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot | DFA_S01_reject[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot | DFA_S10_onA[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot | DFA_S11_onA[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot | DFA_S11_reject[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot | DFA_S10_onB[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot | DFA_S11_onB[s, sn]
}
    
fact __traces_fact {
    __initial[__Snapshot/first]
    
    some __Snapshot/back
        => (all s : one __Snapshot | __small_step[s, s.__Snapshot/next])
        else (all s : one __Snapshot - __Snapshot/last |
            __small_step[s, s.__Snapshot/next])
}
    
fact __allSnapshotsDiff {
    all s : one __Snapshot, sn : one __Snapshot |
        s.__conf0 = sn.__conf0 and s.__taken0 = sn.__taken0 and
            s.DFA_input = sn.DFA_input and
            s.DFA_output = sn.DFA_output =>
            s = sn
}
    
check {
    evens[DshSnapshot/first.DFA_input] <=> isTrue[DshSnapshot/last.DFA_output]
}
    for exactly 8 DshSnapshot 
    
