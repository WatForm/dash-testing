// simple sigs

sig A {
	f : one A
}

sig B {
	g : one A -> some B
}

sig C in A + B {
	h : some A -> some B
}
{
	some univ
}

sig D extends A {

}

sig E extends B {

}

fact "gh" {
	some univ
	one univ
	lone univ
	no univ
	some univ + univ
	some univ - univ
	some univ -> univ
	univ in univ
	some univ <: iden
	some iden :> univ
	some iden ++ iden
	some ~iden
	#univ > #univ
	#univ >= #univ
	#univ < #univ
	#univ <= #univ
	#univ =< #univ
	univ = univ
	not (univ != univ)
	(univ = univ) and (univ = univ)
	(univ = univ) or (univ = univ)
	(univ = univ) => (univ = univ)
	(univ = univ) <=> (univ = univ)
	(univ = univ) => {some univ} else {lone univ}
}
