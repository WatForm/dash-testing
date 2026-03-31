open util/ordering [Temp] as temp
    
open util/traces [__Snapshot] as __Snapshot
    
open util/boolean 
    
sig Temp {} 
    
abstract sig ValvePos {} 
    
one sig OPEN extends ValvePos {} 
    
one sig HALF extends ValvePos {} 
    
one sig CLOSED extends ValvePos {} 
    
sig Identifier {} 
    
abstract sig __States {} 
    
abstract sig HeatingSystem extends __States {} 
    
abstract sig __Scopes {} 
    
one sig HeatingSystem_Scope extends __Scopes {} 
    
abstract sig HeatingSystem_Functioning extends HeatingSystem {} 
    
abstract sig HeatingSystem_Functioning_Furnace extends
    HeatingSystem_Functioning {} 
    
one sig HeatingSystem_Functioning_Furnace_Scope extends __Scopes {} 
    
abstract sig HeatingSystem_Functioning_Furnace_Furnace_Normal extends
    HeatingSystem_Functioning_Furnace {} 
    
one sig HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off extends
    HeatingSystem_Functioning_Furnace_Furnace_Normal {} 
    
one sig HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating extends
    HeatingSystem_Functioning_Furnace_Furnace_Normal {} 
    
one sig HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running extends
    HeatingSystem_Functioning_Furnace_Furnace_Normal {} 
    
abstract sig HeatingSystem_Functioning_Controller extends
    HeatingSystem_Functioning {} 
    
one sig HeatingSystem_Functioning_Controller_Scope extends __Scopes {} 
    
one sig HeatingSystem_Functioning_Controller_Off extends
    HeatingSystem_Functioning_Controller {} 
    
abstract sig HeatingSystem_Functioning_Controller_On extends
    HeatingSystem_Functioning_Controller {} 
    
one sig HeatingSystem_Functioning_Controller_On_Idle extends
    HeatingSystem_Functioning_Controller_On {} 
    
one sig HeatingSystem_Functioning_Controller_On_Heater_Active extends
    HeatingSystem_Functioning_Controller_On {} 
    
abstract sig HeatingSystem_Functioning_Room extends
    HeatingSystem_Functioning {} 
    
one sig HeatingSystem_Functioning_Room_Scope extends __Scopes {} 
    
abstract sig HeatingSystem_Functioning_Room_No_Heat_Request extends
    HeatingSystem_Functioning_Room {} 
    
one sig HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat extends
    HeatingSystem_Functioning_Room_No_Heat_Request {} 
    
one sig HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat extends
    HeatingSystem_Functioning_Room_No_Heat_Request {} 
    
abstract sig HeatingSystem_Functioning_Room_Heat_Requested extends
    HeatingSystem_Functioning_Room {} 
    
one sig HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating extends
    HeatingSystem_Functioning_Room_Heat_Requested {} 
    
one sig HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool extends
    HeatingSystem_Functioning_Room_Heat_Requested {} 
    
one sig HeatingSystem_ERROR extends HeatingSystem {} 
    
abstract sig Transitions {} 
    
one sig HeatingSystem_Functioning_Controller_Off_T8 extends Transitions {} 
    
one sig HeatingSystem_Functioning_Controller_On_Heater_Active_T10 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Controller_On_Heater_Active_T11 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T4 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T5 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T3 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_coolRoom extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_T12 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T17 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off_T1 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T16 extends
    Transitions {} 
    
one sig HeatingSystem_ERROR_T19 extends Transitions {} 
    
one sig HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T18 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T14 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T15 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T2 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_T15 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T13 extends
    Transitions {} 
    
one sig HeatingSystem_Functioning_Controller_On_Idle_T9 extends Transitions {} 
    
one sig HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_heatRoom extends
    Transitions {} 
    
sig __Ids in Identifier {} 
    
abstract sig __Events {} 
    
abstract sig __IntEvents extends __Events {} 
    
one sig HeatingSystem_furnaceReset extends __IntEvents {} 
    
one sig HeatingSystem_deactivate extends __IntEvents {} 
    
one sig HeatingSystem_furnaceRunning extends __IntEvents {} 
    
one sig HeatingSystem_activate extends __IntEvents {} 
    
abstract sig __EnvEvents extends __Events {} 
    
one sig HeatingSystem_Functioning_Room_waitedForWarmth extends __EnvEvents {} 
    
one sig HeatingSystem_Functioning_Room_waitedForCool extends __EnvEvents {} 
    
one sig HeatingSystem_furnaceFault extends __EnvEvents {} 
    
one sig HeatingSystem_heatSwitchOn extends __EnvEvents {} 
    
sig __Snapshot {
    __sc_used0 : set __States,
    __conf0 : set __States,
    __taken0 : lone Transitions,
    __events0 : set __Events,
    __sc_used1 : set __Ids set->set __States,
    __conf1 : set __Ids set->set __States,
    __taken1 : set __Ids set->lone Transitions,
    __events1 : set __Ids set->set __Events,
    __stable : one boolean/Bool,
    HeatingSystem_Functioning_Controller_controllerOn : one Bool,
    HeatingSystem_Functioning_Room_actualTemp : set Identifier set->one Temp,
    HeatingSystem_Functioning_Room_desiredTemp : set Identifier set->one Temp,
    HeatingSystem_Functioning_Room_valvePos : set Identifier set->one ValvePos,
    HeatingSystem_Functioning_Room_requestHeat : set Identifier set->one Bool
} 
    
pred __initial [
    s : one __Snapshot
] {
    all p_HeatingSystem_Functioning_Room : one Identifier |
        s.__conf0 =
            HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off +
                HeatingSystem_Functioning_Controller_Off and
            s.__conf1 =
                p_HeatingSystem_Functioning_Room set->set
                    HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat and
            s.__sc_used0 = none and
            s.__taken0 = none and
            s.__events0 & __IntEvents = none and
            s.__sc_used1 = none set->set none and
            s.__taken1 = none set->set none and
            {s.HeatingSystem_Functioning_Controller_controllerOn = False} and
            {
                p_HeatingSystem_Functioning_Room.
                    (s.
                    HeatingSystem_Functioning_Room_requestHeat) =
                    False
                
                p_HeatingSystem_Functioning_Room.
                    (s.
                    HeatingSystem_Functioning_Room_valvePos) =
                    CLOSED
            }
    
    boolean/isTrue[s.__stable]
}
    
pred HeatingSystem_Functioning_Controller_Off_T8___pre [
    s : one __Snapshot
] {
    some HeatingSystem_Functioning_Controller_Off & s.__conf0
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! HeatingSystem_Functioning_Controller_Scope in s.__sc_used0
    
    boolean/isTrue[
        s.__stable
    ]
        => HeatingSystem_heatSwitchOn in s.__events0 & __EnvEvents
        else HeatingSystem_heatSwitchOn in s.__events0
}
    
pred HeatingSystem_Functioning_Controller_Off_T8___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some HeatingSystem_Functioning_Controller_Off & sn.__conf0
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
               ! HeatingSystem_Functioning_Controller_Scope in sc0 and
            HeatingSystem_heatSwitchOn in s.__events0 & __EnvEvents + genEvs0
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
                 ! HeatingSystem_Functioning_Controller_Scope in
                     s.__sc_used0 + sc0 and
            HeatingSystem_heatSwitchOn in s.__events0 + genEvs0
}
    
pred HeatingSystem_Functioning_Controller_Off_T8___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 =
        s.__conf0 -
            (HeatingSystem_Functioning_Controller_Off +
                 HeatingSystem_Functioning_Controller_On_Idle +
                 HeatingSystem_Functioning_Controller_On_Heater_Active) +
            HeatingSystem_Functioning_Controller_On_Idle
    
    sn.__conf1 = s.__conf1
    
    sn.__taken0 = HeatingSystem_Functioning_Controller_Off_T8
    
    sn.__taken1 = none set->set none
    
    sn.HeatingSystem_Functioning_Controller_controllerOn = True
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        none,
        HeatingSystem_Functioning_Controller_Scope,
        HeatingSystem_furnaceReset,
        none set->set none,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = HeatingSystem_furnaceReset
                 else sn.__events0 & __IntEvents =
                     s.__events0 & __IntEvents + HeatingSystem_furnaceReset)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = HeatingSystem_furnaceReset and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__sc_used0 =
                            HeatingSystem_Functioning_Controller_Scope and
                     sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents
                 else sn.__events0 = s.__events0 + HeatingSystem_furnaceReset and
                          sn.__sc_used0 =
                              s.__sc_used0 +
                                  HeatingSystem_Functioning_Controller_Scope and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 = s.__sc_used1)
}
    
pred HeatingSystem_Functioning_Controller_Off_T8 [
    s : one __Snapshot, sn : one __Snapshot
] {
    HeatingSystem_Functioning_Controller_Off_T8___pre[s]
    
    HeatingSystem_Functioning_Controller_Off_T8___post[s, sn]
}
    
pred HeatingSystem_Functioning_Controller_On_Heater_Active_T10___pre [
    s : one __Snapshot
] {
    some HeatingSystem_Functioning_Controller_On_Heater_Active & s.__conf0
    
    no r : one Identifier |
        r.(s.HeatingSystem_Functioning_Room_requestHeat) = True
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! HeatingSystem_Functioning_Controller_Scope in s.__sc_used0
}
    
pred HeatingSystem_Functioning_Controller_On_Heater_Active_T10___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some HeatingSystem_Functioning_Controller_On_Heater_Active & sn.__conf0
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            ! HeatingSystem_Functioning_Controller_Scope in sc0
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            ! HeatingSystem_Functioning_Controller_Scope in s.__sc_used0 + sc0
}
    
pred HeatingSystem_Functioning_Controller_On_Heater_Active_T10___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 =
        s.__conf0 -
            (HeatingSystem_Functioning_Controller_On_Idle +
                 HeatingSystem_Functioning_Controller_On_Heater_Active) +
            HeatingSystem_Functioning_Controller_On_Idle
    
    sn.__conf1 = s.__conf1
    
    sn.__taken0 = HeatingSystem_Functioning_Controller_On_Heater_Active_T10
    
    sn.__taken1 = none set->set none
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        none,
        HeatingSystem_Functioning_Controller_Scope,
        HeatingSystem_deactivate,
        none set->set none,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = HeatingSystem_deactivate
                 else sn.__events0 & __IntEvents =
                     s.__events0 & __IntEvents + HeatingSystem_deactivate)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = HeatingSystem_deactivate and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__sc_used0 =
                            HeatingSystem_Functioning_Controller_Scope and
                     sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents
                 else sn.__events0 = s.__events0 + HeatingSystem_deactivate and
                          sn.__sc_used0 =
                              s.__sc_used0 +
                                  HeatingSystem_Functioning_Controller_Scope and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 = s.__sc_used1)
}
    
pred HeatingSystem_Functioning_Controller_On_Heater_Active_T10 [
    s : one __Snapshot, sn : one __Snapshot
] {
    HeatingSystem_Functioning_Controller_On_Heater_Active_T10___pre[s]
    
    HeatingSystem_Functioning_Controller_On_Heater_Active_T10___post[s, sn]
}
    
pred HeatingSystem_Functioning_Controller_On_Heater_Active_T11___pre [
    s : one __Snapshot
] {
    some HeatingSystem_Functioning_Controller_On_Heater_Active & s.__conf0
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    boolean/isTrue[
        s.__stable
    ]
        => HeatingSystem_furnaceFault in s.__events0 & __EnvEvents
        else HeatingSystem_furnaceFault in s.__events0
}
    
pred HeatingSystem_Functioning_Controller_On_Heater_Active_T11___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some HeatingSystem_Functioning_Controller_On_Heater_Active & sn.__conf0
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            HeatingSystem_furnaceFault in s.__events0 & __EnvEvents + genEvs0
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            HeatingSystem_furnaceFault in s.__events0 + genEvs0
}
    
pred HeatingSystem_Functioning_Controller_On_Heater_Active_T11___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 =
        s.__conf0 -
            (HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running +
                 HeatingSystem_Functioning_Controller_Off +
                 HeatingSystem_Functioning_Controller_On_Idle +
                 HeatingSystem_Functioning_Controller_On_Heater_Active +
                 HeatingSystem_ERROR) +
            HeatingSystem_ERROR
    
    sn.__conf1 =
        s.__conf1 -
            (Identifier set->set
                 HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat +
                 Identifier set->set
                     HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat +
                 Identifier set->set
                     HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating +
                 Identifier set->set
                     HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool)
    
    sn.__taken0 = HeatingSystem_Functioning_Controller_On_Heater_Active_T11
    
    sn.__taken1 = none set->set none
    
    sn.HeatingSystem_Functioning_Controller_controllerOn = False
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        none,
        HeatingSystem_Scope,
        none,
        none set->set none,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__sc_used0 = HeatingSystem_Scope and
                     sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 + HeatingSystem_Scope and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 = s.__sc_used1)
}
    
pred HeatingSystem_Functioning_Controller_On_Heater_Active_T11 [
    s : one __Snapshot, sn : one __Snapshot
] {
    HeatingSystem_Functioning_Controller_On_Heater_Active_T11___pre[s]
    
    HeatingSystem_Functioning_Controller_On_Heater_Active_T11___post[s, sn]
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T4___pre [
    s : one __Snapshot
] {
    some HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running &
             s.__conf0
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! HeatingSystem_Functioning_Furnace_Scope in s.__sc_used0
    
    ! boolean/isTrue[s.__stable]
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T4___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running &
             sn.__conf0
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
               ! HeatingSystem_Functioning_Furnace_Scope in sc0 and
            HeatingSystem_deactivate in s.__events0 & __EnvEvents + genEvs0
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
                 ! HeatingSystem_Functioning_Furnace_Scope in s.__sc_used0 + sc0 and
            HeatingSystem_deactivate in s.__events0 + genEvs0
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T4___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 =
        s.__conf0 -
            (HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running) +
            HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off
    
    sn.__conf1 = s.__conf1
    
    sn.__taken0 =
        HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T4
    
    sn.__taken1 = none set->set none
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        none,
        HeatingSystem_Functioning_Furnace_Scope,
        none,
        none set->set none,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__sc_used0 = HeatingSystem_Functioning_Furnace_Scope and
                     sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 =
                              s.__sc_used0 +
                                  HeatingSystem_Functioning_Furnace_Scope and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 = s.__sc_used1)
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T4 [
    s : one __Snapshot, sn : one __Snapshot
] {
    HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T4___pre[s]
    
    HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T4___post[
        s, sn
    ]
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T5___pre [
    s : one __Snapshot
] {
    some HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running &
             s.__conf0
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    boolean/isTrue[
        s.__stable
    ]
        => HeatingSystem_furnaceFault in s.__events0 & __EnvEvents
        else HeatingSystem_furnaceFault in s.__events0
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T5___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running &
             sn.__conf0
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            HeatingSystem_furnaceFault in s.__events0 & __EnvEvents + genEvs0
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            HeatingSystem_furnaceFault in s.__events0 + genEvs0
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T5___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 =
        s.__conf0 -
            (HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running +
                 HeatingSystem_Functioning_Controller_Off +
                 HeatingSystem_Functioning_Controller_On_Idle +
                 HeatingSystem_Functioning_Controller_On_Heater_Active +
                 HeatingSystem_ERROR) +
            HeatingSystem_ERROR
    
    sn.__conf1 =
        s.__conf1 -
            (Identifier set->set
                 HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat +
                 Identifier set->set
                     HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat +
                 Identifier set->set
                     HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating +
                 Identifier set->set
                     HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool)
    
    sn.__taken0 =
        HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T5
    
    sn.__taken1 = none set->set none
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        none,
        HeatingSystem_Scope,
        none,
        none set->set none,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__sc_used0 = HeatingSystem_Scope and
                     sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 + HeatingSystem_Scope and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 = s.__sc_used1)
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T5 [
    s : one __Snapshot, sn : one __Snapshot
] {
    HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T5___pre[s]
    
    HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T5___post[
        s, sn
    ]
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T3___pre [
    s : one __Snapshot
] {
    some HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating &
             s.__conf0
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! HeatingSystem_Functioning_Furnace_Scope in s.__sc_used0
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T3___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating &
             sn.__conf0
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            ! HeatingSystem_Functioning_Furnace_Scope in sc0
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            ! HeatingSystem_Functioning_Furnace_Scope in s.__sc_used0 + sc0
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T3___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 =
        s.__conf0 -
            (HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running) +
            HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running
    
    sn.__conf1 = s.__conf1
    
    sn.__taken0 =
        HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T3
    
    sn.__taken1 = none set->set none
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        none,
        HeatingSystem_Functioning_Furnace_Scope,
        HeatingSystem_furnaceRunning,
        none set->set none,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = HeatingSystem_furnaceRunning
                 else sn.__events0 & __IntEvents =
                     s.__events0 & __IntEvents + HeatingSystem_furnaceRunning)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = HeatingSystem_furnaceRunning and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__sc_used0 = HeatingSystem_Functioning_Furnace_Scope and
                     sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents
                 else sn.__events0 = s.__events0 + HeatingSystem_furnaceRunning and
                          sn.__sc_used0 =
                              s.__sc_used0 +
                                  HeatingSystem_Functioning_Furnace_Scope and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 = s.__sc_used1)
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T3 [
    s : one __Snapshot, sn : one __Snapshot
] {
    HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T3___pre[
        s
    ]
    
    HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T3___post[
        s, sn
    ]
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_coolRoom___pre [
    s : one __Snapshot, p_HeatingSystem_Functioning_Room : one Identifier
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat &
             s.__conf1
    
    ! lt[
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp),
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp)
    ]
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! p_HeatingSystem_Functioning_Room set->set
          HeatingSystem_Functioning_Room_Scope in
        s.__sc_used1
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_coolRoom___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat &
             sn.__conf1
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                sc1
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                s.__sc_used1 + sc1
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_coolRoom___post [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    sn.__conf0 = s.__conf0
    
    sn.__conf1 =
        s.__conf1 -
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat +
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat
    
    sn.__taken0 = none
    
    sn.__taken1 =
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_coolRoom
    
    p_HeatingSystem_Functioning_Room.
        (sn.
        HeatingSystem_Functioning_Room_actualTemp) =
        temp/prev[
            p_HeatingSystem_Functioning_Room.
                (s.
                HeatingSystem_Functioning_Room_actualTemp)
        ]
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        p_HeatingSystem_Functioning_Room,
        none,
        none,
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Scope,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents and
                     sn.__sc_used1 =
                         p_HeatingSystem_Functioning_Room set->set
                             HeatingSystem_Functioning_Room_Scope
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 =
                         s.__sc_used1 +
                             p_HeatingSystem_Functioning_Room set->set
                                 HeatingSystem_Functioning_Room_Scope)
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_coolRoom [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_coolRoom___pre[
        s, p_HeatingSystem_Functioning_Room
    ]
    
    HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_coolRoom___post[
        s, sn, p_HeatingSystem_Functioning_Room
    ]
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_T12___pre [
    s : one __Snapshot, p_HeatingSystem_Functioning_Room : one Identifier
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat &
             s.__conf1
    
    lt[
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp),
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp)
    ]
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! p_HeatingSystem_Functioning_Room set->set
          HeatingSystem_Functioning_Room_Scope in
        s.__sc_used1
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_T12___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat &
             sn.__conf1
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                sc1
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                s.__sc_used1 + sc1
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_T12___post [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    sn.__conf0 = s.__conf0
    
    sn.__conf1 =
        s.__conf1 -
            (p_HeatingSystem_Functioning_Room set->set
                 HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat +
                 p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat) +
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat
    
    sn.__taken0 = none
    
    sn.__taken1 =
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_T12
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        p_HeatingSystem_Functioning_Room,
        none,
        none,
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Scope,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents and
                     sn.__sc_used1 =
                         p_HeatingSystem_Functioning_Room set->set
                             HeatingSystem_Functioning_Room_Scope
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 =
                         s.__sc_used1 +
                             p_HeatingSystem_Functioning_Room set->set
                                 HeatingSystem_Functioning_Room_Scope)
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_T12 [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_T12___pre[
        s, p_HeatingSystem_Functioning_Room
    ]
    
    HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_T12___post[
        s, sn, p_HeatingSystem_Functioning_Room
    ]
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T17___pre [
    s : one __Snapshot, p_HeatingSystem_Functioning_Room : one Identifier
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool &
             s.__conf1
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! p_HeatingSystem_Functioning_Room set->set
          HeatingSystem_Functioning_Room_Scope in
        s.__sc_used1
    
    boolean/isTrue[
        s.__stable
    ]
        => p_HeatingSystem_Functioning_Room set->set
               HeatingSystem_Functioning_Room_waitedForCool in
            s.__events1 :> __EnvEvents
        else p_HeatingSystem_Functioning_Room set->set
                 HeatingSystem_Functioning_Room_waitedForCool in
            s.__events1
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T17___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool &
             sn.__conf1
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
               ! p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_Scope in
                   sc1 and
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_waitedForCool in
                s.__events1 :> __EnvEvents + genEvs1
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
                 ! p_HeatingSystem_Functioning_Room set->set
                       HeatingSystem_Functioning_Room_Scope in
                     s.__sc_used1 + sc1 and
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_waitedForCool in
                s.__events1 + genEvs1
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T17___post [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    sn.__conf0 = s.__conf0
    
    sn.__conf1 =
        s.__conf1 -
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool +
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool
    
    sn.__taken0 = none
    
    sn.__taken1 =
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T17
    
    p_HeatingSystem_Functioning_Room.
        (sn.
        HeatingSystem_Functioning_Room_valvePos) =
        CLOSED
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    ___nextIsStable[
        s,
        sn,
        p_HeatingSystem_Functioning_Room,
        none,
        none,
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Scope,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents and
                     sn.__sc_used1 =
                         p_HeatingSystem_Functioning_Room set->set
                             HeatingSystem_Functioning_Room_Scope
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 =
                         s.__sc_used1 +
                             p_HeatingSystem_Functioning_Room set->set
                                 HeatingSystem_Functioning_Room_Scope)
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T17 [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T17___pre[
        s, p_HeatingSystem_Functioning_Room
    ]
    
    HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T17___post[
        s, sn, p_HeatingSystem_Functioning_Room
    ]
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off_T1___pre [
    s : one __Snapshot
] {
    some HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off &
             s.__conf0
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! HeatingSystem_Functioning_Furnace_Scope in s.__sc_used0
    
    ! boolean/isTrue[s.__stable]
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off_T1___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off &
             sn.__conf0
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
               ! HeatingSystem_Functioning_Furnace_Scope in sc0 and
            HeatingSystem_activate in s.__events0 & __EnvEvents + genEvs0
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
                 ! HeatingSystem_Functioning_Furnace_Scope in s.__sc_used0 + sc0 and
            HeatingSystem_activate in s.__events0 + genEvs0
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off_T1___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 =
        s.__conf0 -
            (HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running) +
            HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating
    
    sn.__conf1 = s.__conf1
    
    sn.__taken0 =
        HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off_T1
    
    sn.__taken1 = none set->set none
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        none,
        HeatingSystem_Functioning_Furnace_Scope,
        none,
        none set->set none,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__sc_used0 = HeatingSystem_Functioning_Furnace_Scope and
                     sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 =
                              s.__sc_used0 +
                                  HeatingSystem_Functioning_Furnace_Scope and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 = s.__sc_used1)
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off_T1 [
    s : one __Snapshot, sn : one __Snapshot
] {
    HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off_T1___pre[s]
    
    HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off_T1___post[
        s, sn
    ]
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T16___pre [
    s : one __Snapshot, p_HeatingSystem_Functioning_Room : one Identifier
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool &
             s.__conf1
    
    ! gt[
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp),
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp)
    ]
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! p_HeatingSystem_Functioning_Room set->set
          HeatingSystem_Functioning_Room_Scope in
        s.__sc_used1
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T16___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool &
             sn.__conf1
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                sc1
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                s.__sc_used1 + sc1
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T16___post [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    sn.__conf0 = s.__conf0
    
    sn.__conf1 =
        s.__conf1 -
            (p_HeatingSystem_Functioning_Room set->set
                 HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating +
                 p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool) +
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating
    
    sn.__taken0 = none
    
    sn.__taken1 =
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T16
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        p_HeatingSystem_Functioning_Room,
        none,
        none,
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Scope,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents and
                     sn.__sc_used1 =
                         p_HeatingSystem_Functioning_Room set->set
                             HeatingSystem_Functioning_Room_Scope
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 =
                         s.__sc_used1 +
                             p_HeatingSystem_Functioning_Room set->set
                                 HeatingSystem_Functioning_Room_Scope)
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T16 [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T16___pre[
        s, p_HeatingSystem_Functioning_Room
    ]
    
    HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T16___post[
        s, sn, p_HeatingSystem_Functioning_Room
    ]
}
    
pred HeatingSystem_ERROR_T19___pre [
    s : one __Snapshot
] {
    some HeatingSystem_ERROR & s.__conf0
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    boolean/isTrue[
        s.__stable
    ]
        => HeatingSystem_heatSwitchOn in s.__events0 & __EnvEvents
        else HeatingSystem_heatSwitchOn in s.__events0
}
    
pred HeatingSystem_ERROR_T19___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some HeatingSystem_ERROR & sn.__conf0
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            HeatingSystem_heatSwitchOn in s.__events0 & __EnvEvents + genEvs0
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            HeatingSystem_heatSwitchOn in s.__events0 + genEvs0
}
    
pred HeatingSystem_ERROR_T19___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 =
        s.__conf0 -
            (HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running +
                 HeatingSystem_Functioning_Controller_Off +
                 HeatingSystem_Functioning_Controller_On_Idle +
                 HeatingSystem_Functioning_Controller_On_Heater_Active +
                 HeatingSystem_ERROR) +
            (HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off +
                 HeatingSystem_Functioning_Controller_Off)
    
    sn.__conf1 =
        s.__conf1 -
            (Identifier set->set
                 HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat +
                 Identifier set->set
                     HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat +
                 Identifier set->set
                     HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating +
                 Identifier set->set
                     HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool) +
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat
    
    sn.__taken0 = HeatingSystem_ERROR_T19
    
    sn.__taken1 = none set->set none
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        none,
        HeatingSystem_Scope,
        none,
        none set->set none,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__sc_used0 = HeatingSystem_Scope and
                     sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 + HeatingSystem_Scope and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 = s.__sc_used1)
}
    
pred HeatingSystem_ERROR_T19 [
    s : one __Snapshot, sn : one __Snapshot
] {
    HeatingSystem_ERROR_T19___pre[s]
    
    HeatingSystem_ERROR_T19___post[s, sn]
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T18___pre [
    s : one __Snapshot, p_HeatingSystem_Functioning_Room : one Identifier
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool &
             s.__conf1
    
    p_HeatingSystem_Functioning_Room.(s.HeatingSystem_Functioning_Room_valvePos) =
        CLOSED
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! p_HeatingSystem_Functioning_Room set->set
          HeatingSystem_Functioning_Room_Scope in
        s.__sc_used1
    
    boolean/isTrue[
        s.__stable
    ]
        => p_HeatingSystem_Functioning_Room set->set
               HeatingSystem_Functioning_Room_waitedForCool in
            s.__events1 :> __EnvEvents
        else p_HeatingSystem_Functioning_Room set->set
                 HeatingSystem_Functioning_Room_waitedForCool in
            s.__events1
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T18___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool &
             sn.__conf1
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
               ! p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_Scope in
                   sc1 and
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_waitedForCool in
                s.__events1 :> __EnvEvents + genEvs1
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
                 ! p_HeatingSystem_Functioning_Room set->set
                       HeatingSystem_Functioning_Room_Scope in
                     s.__sc_used1 + sc1 and
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_waitedForCool in
                s.__events1 + genEvs1
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T18___post [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    sn.__conf0 = s.__conf0
    
    sn.__conf1 =
        s.__conf1 -
            (p_HeatingSystem_Functioning_Room set->set
                 HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat +
                 p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat +
                 p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating +
                 p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool) +
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat
    
    sn.__taken0 = none
    
    sn.__taken1 =
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T18
    
    {
        p_HeatingSystem_Functioning_Room.
            (sn.
            HeatingSystem_Functioning_Room_requestHeat) =
            False
        
        p_HeatingSystem_Functioning_Room.
            (sn.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (s.
                HeatingSystem_Functioning_Room_desiredTemp)
    }
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        p_HeatingSystem_Functioning_Room,
        none,
        none,
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Scope,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents and
                     sn.__sc_used1 =
                         p_HeatingSystem_Functioning_Room set->set
                             HeatingSystem_Functioning_Room_Scope
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 =
                         s.__sc_used1 +
                             p_HeatingSystem_Functioning_Room set->set
                                 HeatingSystem_Functioning_Room_Scope)
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T18 [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T18___pre[
        s, p_HeatingSystem_Functioning_Room
    ]
    
    HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T18___post[
        s, sn, p_HeatingSystem_Functioning_Room
    ]
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T14___pre [
    s : one __Snapshot, p_HeatingSystem_Functioning_Room : one Identifier
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat &
             s.__conf1
    
    p_HeatingSystem_Functioning_Room.(s.HeatingSystem_Functioning_Room_valvePos) =
        CLOSED
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! p_HeatingSystem_Functioning_Room set->set
          HeatingSystem_Functioning_Room_Scope in
        s.__sc_used1
    
    boolean/isTrue[
        s.__stable
    ]
        => p_HeatingSystem_Functioning_Room set->set
               HeatingSystem_Functioning_Room_waitedForWarmth in
            s.__events1 :> __EnvEvents
        else p_HeatingSystem_Functioning_Room set->set
                 HeatingSystem_Functioning_Room_waitedForWarmth in
            s.__events1
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T14___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat &
             sn.__conf1
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
               ! p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_Scope in
                   sc1 and
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_waitedForWarmth in
                s.__events1 :> __EnvEvents + genEvs1
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
                 ! p_HeatingSystem_Functioning_Room set->set
                       HeatingSystem_Functioning_Room_Scope in
                     s.__sc_used1 + sc1 and
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_waitedForWarmth in
                s.__events1 + genEvs1
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T14___post [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    sn.__conf0 = s.__conf0
    
    sn.__conf1 =
        s.__conf1 -
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat +
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat
    
    sn.__taken0 = none
    
    sn.__taken1 =
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T14
    
    p_HeatingSystem_Functioning_Room.
        (sn.
        HeatingSystem_Functioning_Room_valvePos) =
        OPEN
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    ___nextIsStable[
        s,
        sn,
        p_HeatingSystem_Functioning_Room,
        none,
        none,
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Scope,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents and
                     sn.__sc_used1 =
                         p_HeatingSystem_Functioning_Room set->set
                             HeatingSystem_Functioning_Room_Scope
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 =
                         s.__sc_used1 +
                             p_HeatingSystem_Functioning_Room set->set
                                 HeatingSystem_Functioning_Room_Scope)
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T14 [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T14___pre[
        s, p_HeatingSystem_Functioning_Room
    ]
    
    HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T14___post[
        s, sn, p_HeatingSystem_Functioning_Room
    ]
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T15___pre [
    s : one __Snapshot, p_HeatingSystem_Functioning_Room : one Identifier
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat &
             s.__conf1
    
    p_HeatingSystem_Functioning_Room.(s.HeatingSystem_Functioning_Room_valvePos) =
        OPEN and
        s.HeatingSystem_Functioning_Controller_controllerOn = True
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! p_HeatingSystem_Functioning_Room set->set
          HeatingSystem_Functioning_Room_Scope in
        s.__sc_used1
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T15___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat &
             sn.__conf1
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                sc1
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                s.__sc_used1 + sc1
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T15___post [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    sn.__conf0 = s.__conf0
    
    sn.__conf1 =
        s.__conf1 -
            (p_HeatingSystem_Functioning_Room set->set
                 HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat +
                 p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat +
                 p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating +
                 p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool) +
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating
    
    sn.__taken0 = none
    
    sn.__taken1 =
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T15
    
    p_HeatingSystem_Functioning_Room.
        (sn.
        HeatingSystem_Functioning_Room_requestHeat) =
        True
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        p_HeatingSystem_Functioning_Room,
        none,
        none,
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Scope,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents and
                     sn.__sc_used1 =
                         p_HeatingSystem_Functioning_Room set->set
                             HeatingSystem_Functioning_Room_Scope
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 =
                         s.__sc_used1 +
                             p_HeatingSystem_Functioning_Room set->set
                                 HeatingSystem_Functioning_Room_Scope)
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T15 [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T15___pre[
        s, p_HeatingSystem_Functioning_Room
    ]
    
    HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T15___post[
        s, sn, p_HeatingSystem_Functioning_Room
    ]
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T2___pre [
    s : one __Snapshot
] {
    some HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating &
             s.__conf0
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! HeatingSystem_Functioning_Furnace_Scope in s.__sc_used0
    
    ! boolean/isTrue[s.__stable]
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T2___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating &
             sn.__conf0
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
               ! HeatingSystem_Functioning_Furnace_Scope in sc0 and
            HeatingSystem_deactivate in s.__events0 & __EnvEvents + genEvs0
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
                 ! HeatingSystem_Functioning_Furnace_Scope in s.__sc_used0 + sc0 and
            HeatingSystem_deactivate in s.__events0 + genEvs0
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T2___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 =
        s.__conf0 -
            (HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating +
                 HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running) +
            HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off
    
    sn.__conf1 = s.__conf1
    
    sn.__taken0 =
        HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T2
    
    sn.__taken1 = none set->set none
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        none,
        HeatingSystem_Functioning_Furnace_Scope,
        none,
        none set->set none,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__sc_used0 = HeatingSystem_Functioning_Furnace_Scope and
                     sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 =
                              s.__sc_used0 +
                                  HeatingSystem_Functioning_Furnace_Scope and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 = s.__sc_used1)
}
    
pred HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T2 [
    s : one __Snapshot, sn : one __Snapshot
] {
    HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T2___pre[
        s
    ]
    
    HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T2___post[
        s, sn
    ]
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_T15___pre [
    s : one __Snapshot, p_HeatingSystem_Functioning_Room : one Identifier
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating &
             s.__conf1
    
    gt[
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp),
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp)
    ]
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! p_HeatingSystem_Functioning_Room set->set
          HeatingSystem_Functioning_Room_Scope in
        s.__sc_used1
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_T15___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating &
             sn.__conf1
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                sc1
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                s.__sc_used1 + sc1
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_T15___post [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    sn.__conf0 = s.__conf0
    
    sn.__conf1 =
        s.__conf1 -
            (p_HeatingSystem_Functioning_Room set->set
                 HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating +
                 p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool) +
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool
    
    sn.__taken0 = none
    
    sn.__taken1 =
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_T15
    
    p_HeatingSystem_Functioning_Room.
        (sn.
        HeatingSystem_Functioning_Room_valvePos) =
        CLOSED
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    ___nextIsStable[
        s,
        sn,
        p_HeatingSystem_Functioning_Room,
        none,
        none,
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Scope,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents and
                     sn.__sc_used1 =
                         p_HeatingSystem_Functioning_Room set->set
                             HeatingSystem_Functioning_Room_Scope
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 =
                         s.__sc_used1 +
                             p_HeatingSystem_Functioning_Room set->set
                                 HeatingSystem_Functioning_Room_Scope)
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_T15 [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_T15___pre[
        s, p_HeatingSystem_Functioning_Room
    ]
    
    HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_T15___post[
        s, sn, p_HeatingSystem_Functioning_Room
    ]
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T13___pre [
    s : one __Snapshot, p_HeatingSystem_Functioning_Room : one Identifier
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat &
             s.__conf1
    
    ! lt[
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp),
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp)
    ]
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! p_HeatingSystem_Functioning_Room set->set
          HeatingSystem_Functioning_Room_Scope in
        s.__sc_used1
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T13___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat &
             sn.__conf1
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                sc1
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                s.__sc_used1 + sc1
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T13___post [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    sn.__conf0 = s.__conf0
    
    sn.__conf1 =
        s.__conf1 -
            (p_HeatingSystem_Functioning_Room set->set
                 HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat +
                 p_HeatingSystem_Functioning_Room set->set
                     HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat) +
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat
    
    sn.__taken0 = none
    
    sn.__taken1 =
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T13
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        p_HeatingSystem_Functioning_Room,
        none,
        none,
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Scope,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents and
                     sn.__sc_used1 =
                         p_HeatingSystem_Functioning_Room set->set
                             HeatingSystem_Functioning_Room_Scope
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 =
                         s.__sc_used1 +
                             p_HeatingSystem_Functioning_Room set->set
                                 HeatingSystem_Functioning_Room_Scope)
}
    
pred HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T13 [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T13___pre[
        s, p_HeatingSystem_Functioning_Room
    ]
    
    HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T13___post[
        s, sn, p_HeatingSystem_Functioning_Room
    ]
}
    
pred HeatingSystem_Functioning_Controller_On_Idle_T9___pre [
    s : one __Snapshot
] {
    some HeatingSystem_Functioning_Controller_On_Idle & s.__conf0
    
    some r : one Identifier |
        r.(s.HeatingSystem_Functioning_Room_requestHeat) = True
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! HeatingSystem_Functioning_Controller_Scope in s.__sc_used0
}
    
pred HeatingSystem_Functioning_Controller_On_Idle_T9___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some HeatingSystem_Functioning_Controller_On_Idle & sn.__conf0
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            ! HeatingSystem_Functioning_Controller_Scope in sc0
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            ! HeatingSystem_Functioning_Controller_Scope in s.__sc_used0 + sc0
}
    
pred HeatingSystem_Functioning_Controller_On_Idle_T9___post [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__conf0 =
        s.__conf0 -
            (HeatingSystem_Functioning_Controller_On_Idle +
                 HeatingSystem_Functioning_Controller_On_Heater_Active) +
            HeatingSystem_Functioning_Controller_On_Heater_Active
    
    sn.__conf1 = s.__conf1
    
    sn.__taken0 = HeatingSystem_Functioning_Controller_On_Idle_T9
    
    sn.__taken1 = none set->set none
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        none,
        HeatingSystem_Functioning_Controller_Scope,
        HeatingSystem_activate,
        none set->set none,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = HeatingSystem_activate
                 else sn.__events0 & __IntEvents =
                     s.__events0 & __IntEvents + HeatingSystem_activate)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = HeatingSystem_activate and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__sc_used0 =
                            HeatingSystem_Functioning_Controller_Scope and
                     sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents
                 else sn.__events0 = s.__events0 + HeatingSystem_activate and
                          sn.__sc_used0 =
                              s.__sc_used0 +
                                  HeatingSystem_Functioning_Controller_Scope and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 = s.__sc_used1)
}
    
pred HeatingSystem_Functioning_Controller_On_Idle_T9 [
    s : one __Snapshot, sn : one __Snapshot
] {
    HeatingSystem_Functioning_Controller_On_Idle_T9___pre[s]
    
    HeatingSystem_Functioning_Controller_On_Idle_T9___post[s, sn]
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_heatRoom___pre [
    s : one __Snapshot, p_HeatingSystem_Functioning_Room : one Identifier
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating &
             s.__conf1
    
    ! gt[
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp),
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp)
    ]
    
    ! HeatingSystem_Scope in s.__sc_used0
    
    ! p_HeatingSystem_Functioning_Room set->set
          HeatingSystem_Functioning_Room_Scope in
        s.__sc_used1
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_heatRoom___enabledAfterStep [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    some p_HeatingSystem_Functioning_Room set->set
             HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating &
             sn.__conf1
    
    boolean/isTrue[
        s.__stable
    ]
        => ! HeatingSystem_Scope in sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                sc1
        else ! HeatingSystem_Scope in s.__sc_used0 + sc0 and
            ! p_HeatingSystem_Functioning_Room set->set
                  HeatingSystem_Functioning_Room_Scope in
                s.__sc_used1 + sc1
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_heatRoom___post [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    sn.__conf0 = s.__conf0
    
    sn.__conf1 =
        s.__conf1 -
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating +
            p_HeatingSystem_Functioning_Room set->set
                HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating
    
    sn.__taken0 = none
    
    sn.__taken1 =
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_heatRoom
    
    p_HeatingSystem_Functioning_Room.
        (sn.
        HeatingSystem_Functioning_Room_actualTemp) =
        temp/next[
            p_HeatingSystem_Functioning_Room.
                (s.
                HeatingSystem_Functioning_Room_actualTemp)
        ]
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_actualTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_actualTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_requestHeat) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_requestHeat)
    
    s.HeatingSystem_Functioning_Controller_controllerOn =
        sn.HeatingSystem_Functioning_Controller_controllerOn
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_desiredTemp) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_desiredTemp)
    
    all p_HeatingSystem_Functioning_Room : one Identifier |
        p_HeatingSystem_Functioning_Room.
            (s.
            HeatingSystem_Functioning_Room_valvePos) =
            p_HeatingSystem_Functioning_Room.
                (sn.
                HeatingSystem_Functioning_Room_valvePos)
    
    ___nextIsStable[
        s,
        sn,
        p_HeatingSystem_Functioning_Room,
        none,
        none,
        p_HeatingSystem_Functioning_Room set->set
            HeatingSystem_Functioning_Room_Scope,
        none set->set none
    ]
        => boolean/isTrue[sn.__stable] and
               (sn.__sc_used0 = none and sn.__sc_used1 = none set->set none) and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none
                 else sn.__events0 & __IntEvents = s.__events0 & __IntEvents)
        else boolean/isFalse[sn.__stable] and
            (boolean/isTrue[
                 s.__stable
             ]
                 => sn.__events0 & __IntEvents = none and
                        sn.__events0 & __EnvEvents = s.__events0 & __EnvEvents and
                        sn.__events1 :> __EnvEvents = s.__events1 :> __EnvEvents and
                     sn.__sc_used1 =
                         p_HeatingSystem_Functioning_Room set->set
                             HeatingSystem_Functioning_Room_Scope
                 else sn.__events0 = s.__events0 and
                          sn.__sc_used0 = s.__sc_used0 and
                          sn.__events1 = s.__events1 and
                     sn.__sc_used1 =
                         s.__sc_used1 +
                             p_HeatingSystem_Functioning_Room set->set
                                 HeatingSystem_Functioning_Room_Scope)
}
    
pred HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_heatRoom [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier
] {
    HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_heatRoom___pre[
        s, p_HeatingSystem_Functioning_Room
    ]
    
    HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_heatRoom___post[
        s, sn, p_HeatingSystem_Functioning_Room
    ]
}
    
pred ___nextIsStable [
    s : one __Snapshot,
    sn : one __Snapshot,
    p_HeatingSystem_Functioning_Room : one Identifier,
    sc0 : set __Scopes,
    genEvs0 : set __Events,
    sc1 : set __Ids set->set __Scopes,
    genEvs1 : set __Ids set->set __Events
] {
    ! HeatingSystem_Functioning_Controller_Off_T8___enabledAfterStep[
        s, sn, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Controller_On_Heater_Active_T10___enabledAfterStep[
        s, sn, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Controller_On_Heater_Active_T11___enabledAfterStep[
        s, sn, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T4___enabledAfterStep[
        s, sn, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T5___enabledAfterStep[
        s, sn, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T3___enabledAfterStep[
        s, sn, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_coolRoom___enabledAfterStep[
        s, sn, p_HeatingSystem_Functioning_Room, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_T12___enabledAfterStep[
        s, sn, p_HeatingSystem_Functioning_Room, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T17___enabledAfterStep[
        s, sn, p_HeatingSystem_Functioning_Room, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off_T1___enabledAfterStep[
        s, sn, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T16___enabledAfterStep[
        s, sn, p_HeatingSystem_Functioning_Room, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_ERROR_T19___enabledAfterStep[
        s, sn, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T18___enabledAfterStep[
        s, sn, p_HeatingSystem_Functioning_Room, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T14___enabledAfterStep[
        s, sn, p_HeatingSystem_Functioning_Room, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T15___enabledAfterStep[
        s, sn, p_HeatingSystem_Functioning_Room, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T2___enabledAfterStep[
        s, sn, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_T15___enabledAfterStep[
        s, sn, p_HeatingSystem_Functioning_Room, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T13___enabledAfterStep[
        s, sn, p_HeatingSystem_Functioning_Room, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Controller_On_Idle_T9___enabledAfterStep[
        s, sn, sc0, genEvs0, sc1, genEvs1
    ]
    
    ! HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_heatRoom___enabledAfterStep[
        s, sn, p_HeatingSystem_Functioning_Room, sc0, genEvs0, sc1, genEvs1
    ]
}
    
pred __small_step [
    s : one __Snapshot, sn : one __Snapshot
] {
    (some p_HeatingSystem_Functioning_Room : one Identifier |
         HeatingSystem_Functioning_Controller_Off_T8[s, sn] or
             HeatingSystem_Functioning_Controller_On_Heater_Active_T10[s, sn] or
             HeatingSystem_Functioning_Controller_On_Heater_Active_T11[s, sn] or
             HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T4[
                 s, sn
             ] or
             HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T5[
                 s, sn
             ] or
             HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T3[
                 s, sn
             ] or
             HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_coolRoom[
                 s, sn, p_HeatingSystem_Functioning_Room
             ] or
             HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_T12[
                 s, sn, p_HeatingSystem_Functioning_Room
             ] or
             HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T17[
                 s, sn, p_HeatingSystem_Functioning_Room
             ] or
             HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off_T1[
                 s, sn
             ] or
             HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T16[
                 s, sn, p_HeatingSystem_Functioning_Room
             ] or
             HeatingSystem_ERROR_T19[s, sn] or
             HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T18[
                 s, sn, p_HeatingSystem_Functioning_Room
             ] or
             HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T14[
                 s, sn, p_HeatingSystem_Functioning_Room
             ] or
             HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T15[
                 s, sn, p_HeatingSystem_Functioning_Room
             ] or
             HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T2[
                 s, sn
             ] or
             HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_T15[
                 s, sn, p_HeatingSystem_Functioning_Room
             ] or
             HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T13[
                 s, sn, p_HeatingSystem_Functioning_Room
             ] or
             HeatingSystem_Functioning_Controller_On_Idle_T9[s, sn] or
             HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_heatRoom[
                 s, sn, p_HeatingSystem_Functioning_Room
             ]) or
        ! (some p_HeatingSystem_Functioning_Room : one Identifier |
            HeatingSystem_Functioning_Controller_Off_T8___pre[s] or
                HeatingSystem_Functioning_Controller_On_Heater_Active_T10___pre[
                    s
                ] or
                HeatingSystem_Functioning_Controller_On_Heater_Active_T11___pre[
                    s
                ] or
                HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T4___pre[
                    s
                ] or
                HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T5___pre[
                    s
                ] or
                HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T3___pre[
                    s
                ] or
                HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_coolRoom___pre[
                    s, p_HeatingSystem_Functioning_Room
                ] or
                HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_T12___pre[
                    s, p_HeatingSystem_Functioning_Room
                ] or
                HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T17___pre[
                    s, p_HeatingSystem_Functioning_Room
                ] or
                HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off_T1___pre[
                    s
                ] or
                HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T16___pre[
                    s, p_HeatingSystem_Functioning_Room
                ] or
                HeatingSystem_ERROR_T19___pre[s] or
                HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T18___pre[
                    s, p_HeatingSystem_Functioning_Room
                ] or
                HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T14___pre[
                    s, p_HeatingSystem_Functioning_Room
                ] or
                HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T15___pre[
                    s, p_HeatingSystem_Functioning_Room
                ] or
                HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T2___pre[
                    s
                ] or
                HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_T15___pre[
                    s, p_HeatingSystem_Functioning_Room
                ] or
                HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T13___pre[
                    s, p_HeatingSystem_Functioning_Room
                ] or
                HeatingSystem_Functioning_Controller_On_Idle_T9___pre[s] or
                HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_heatRoom___pre[
                    s, p_HeatingSystem_Functioning_Room
                ]) and
            __stutter[s, sn]
}
    
pred __stutter [
    s : one __Snapshot, sn : one __Snapshot
] {
    sn.__stable = s.__stable
    
    sn.__conf0 = s.__conf0
    
    sn.__sc_used0 = s.__sc_used0
    
    sn.__taken0 = none
    
    sn.__events0 & __IntEvents = none
    
    sn.__conf1 = s.__conf1
    
    sn.__sc_used1 = s.__sc_used1
    
    sn.__taken1 = none set->set none
    
    sn.HeatingSystem_Functioning_Controller_controllerOn =
        s.HeatingSystem_Functioning_Controller_controllerOn
    
    sn.HeatingSystem_Functioning_Room_actualTemp =
        s.HeatingSystem_Functioning_Room_actualTemp
    
    sn.HeatingSystem_Functioning_Room_desiredTemp =
        s.HeatingSystem_Functioning_Room_desiredTemp
    
    sn.HeatingSystem_Functioning_Room_valvePos =
        s.HeatingSystem_Functioning_Room_valvePos
    
    sn.HeatingSystem_Functioning_Room_requestHeat =
        s.HeatingSystem_Functioning_Room_requestHeat
}
    
pred __single_event {
    all s : one __Snapshot |
        lone s.__events0 & __EnvEvents and lone s.__events0 & __EnvEvents or
            lone s.__events1 :> __EnvEvents and lone s.__events1 :> __EnvEvents
}
    
pred __complete_big_steps {
    all s : one __Snapshot |
        boolean/isFalse[s.__stable] =>
            (some sn : one __Snapshot | __small_step[s, sn])
}
    
pred __enough_ops {
    some s : one __Snapshot, sn : one __Snapshot |
        HeatingSystem_Functioning_Controller_Off_T8[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot |
        HeatingSystem_Functioning_Controller_On_Heater_Active_T10[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot |
        HeatingSystem_Functioning_Controller_On_Heater_Active_T11[s, sn]
    
    some s : one __Snapshot, sn : one __Snapshot |
        HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T4[
            s, sn
        ]
    
    some s : one __Snapshot, sn : one __Snapshot |
        HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Running_T5[
            s, sn
        ]
    
    some s : one __Snapshot, sn : one __Snapshot |
        HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T3[
            s, sn
        ]
    
    some s : one __Snapshot,
         sn : one __Snapshot,
         p_HeatingSystem_Functioning_Room : one Identifier |
        HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_coolRoom[
            s, sn, p_HeatingSystem_Functioning_Room
        ]
    
    some s : one __Snapshot,
         sn : one __Snapshot,
         p_HeatingSystem_Functioning_Room : one Identifier |
        HeatingSystem_Functioning_Room_No_Heat_Request_Idle_No_Heat_T12[
            s, sn, p_HeatingSystem_Functioning_Room
        ]
    
    some s : one __Snapshot,
         sn : one __Snapshot,
         p_HeatingSystem_Functioning_Room : one Identifier |
        HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T17[
            s, sn, p_HeatingSystem_Functioning_Room
        ]
    
    some s : one __Snapshot, sn : one __Snapshot |
        HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Off_T1[s, sn]
    
    some s : one __Snapshot,
         sn : one __Snapshot,
         p_HeatingSystem_Functioning_Room : one Identifier |
        HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T16[
            s, sn, p_HeatingSystem_Functioning_Room
        ]
    
    some s : one __Snapshot, sn : one __Snapshot |
        HeatingSystem_ERROR_T19[s, sn]
    
    some s : one __Snapshot,
         sn : one __Snapshot,
         p_HeatingSystem_Functioning_Room : one Identifier |
        HeatingSystem_Functioning_Room_Heat_Requested_Wait_For_Cool_T18[
            s, sn, p_HeatingSystem_Functioning_Room
        ]
    
    some s : one __Snapshot,
         sn : one __Snapshot,
         p_HeatingSystem_Functioning_Room : one Identifier |
        HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T14[
            s, sn, p_HeatingSystem_Functioning_Room
        ]
    
    some s : one __Snapshot,
         sn : one __Snapshot,
         p_HeatingSystem_Functioning_Room : one Identifier |
        HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T15[
            s, sn, p_HeatingSystem_Functioning_Room
        ]
    
    some s : one __Snapshot, sn : one __Snapshot |
        HeatingSystem_Functioning_Furnace_Furnace_Normal_Furnace_Activating_T2[
            s, sn
        ]
    
    some s : one __Snapshot,
         sn : one __Snapshot,
         p_HeatingSystem_Functioning_Room : one Identifier |
        HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_T15[
            s, sn, p_HeatingSystem_Functioning_Room
        ]
    
    some s : one __Snapshot,
         sn : one __Snapshot,
         p_HeatingSystem_Functioning_Room : one Identifier |
        HeatingSystem_Functioning_Room_No_Heat_Request_Wait_For_Heat_T13[
            s, sn, p_HeatingSystem_Functioning_Room
        ]
    
    some s : one __Snapshot, sn : one __Snapshot |
        HeatingSystem_Functioning_Controller_On_Idle_T9[s, sn]
    
    some s : one __Snapshot,
         sn : one __Snapshot,
         p_HeatingSystem_Functioning_Room : one Identifier |
        HeatingSystem_Functioning_Room_Heat_Requested_Idle_Heating_heatRoom[
            s, sn, p_HeatingSystem_Functioning_Room
        ]
}
    
fact __paramsFact {__Ids = Identifier}
    
fact __traces_fact {
    __initial[__Snapshot/first]
    
    some __Snapshot/back
        => (all s : one __Snapshot | __small_step[s, s.__Snapshot/next])
        else (all s : one __Snapshot - __Snapshot/last |
            __small_step[s, s.__Snapshot/next])
}
    
fact __allSnapshotsDiff {
    all s : one __Snapshot, sn : one __Snapshot |
        s.__conf0 = sn.__conf0 and s.__sc_used0 = sn.__sc_used0 and
            s.__taken0 = sn.__taken0 and
            s.__events0 = sn.__events0 and
            s.__conf1 = sn.__conf1 and
            s.__sc_used1 = sn.__sc_used1 and
            s.__taken1 = sn.__taken1 and
            s.__stable = sn.__stable and
            s.HeatingSystem_Functioning_Controller_controllerOn =
                sn.HeatingSystem_Functioning_Controller_controllerOn and
            s.HeatingSystem_Functioning_Room_actualTemp =
                sn.HeatingSystem_Functioning_Room_actualTemp and
            s.HeatingSystem_Functioning_Room_desiredTemp =
                sn.HeatingSystem_Functioning_Room_desiredTemp and
            s.HeatingSystem_Functioning_Room_valvePos =
                sn.HeatingSystem_Functioning_Room_valvePos and
            s.HeatingSystem_Functioning_Room_requestHeat =
                sn.HeatingSystem_Functioning_Room_requestHeat =>
            s = sn
}
    
