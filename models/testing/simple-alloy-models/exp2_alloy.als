// sig hierarchy with "in", toposort

sig E in B+C {}
sig A {}
sig B {}
sig C in B {}
sig D in A+B {}
