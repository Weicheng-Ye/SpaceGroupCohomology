# smoke.tst — representative public API coverage.

gap> START_TEST("SpaceGroupCohomology: smoke test");
gap> SetRecursionTrapInterval(100000000);;

# Ordinary cohomology-ring presentation.
gap> GroupCohomologyMod2(16);;
Z2[Ac,Acp,Ax,Ay,Az]/<R2>
R2:  Ax^2+Ac.Ax+Acp.Ax  Ay^2+Ac.Ay  Az^2+Acp.Az

# Wyckoff table for a group with explicit degree-3 generators.
gap> WPCohomologyTable(22);;
4a Ac^2.Acp+Ac.Acp^2+Ac.Acp.Axy+Ac.Acp.Axz+Cxyz
4b Cxyz
4c Cc+Cxyz
4d Ac.Acp.Axy+Ac.Acp.Axz+Cc+Cxyz

# A nontrivial class in a group with a degree-4 generator.
gap> WPCohomologyClass(108,["4a"]);;
Amp.Ba+Am.Ba+Axyz.Ba+Amp.Bzxy

gap> STOP_TEST("smoke.tst", 0);
