# smoke.tst — sanity check for the SpaceGroupCohomology package.

gap> START_TEST("SpaceGroupCohomology: smoke test");

# One assertion: all 230 data entries are bound after package load.
gap> Length(PGGens230) = 230 and Length(IWP) = 230 and Length(GENNAMES) = 230 and Length(funcs230) = 230;
true

# Test 1: Simple triclinic group
gap> SpaceGroupCohomologyRingGapInterface(1);
===========================================
Mod-2 Cohomology Ring of Group No. 1:
Z2[Ax,Ay,Az]/<R2>
R2:  Ax^2  Ay^2  Az^2
===========================================
LSM:
1a Ax.Ay.Az
true

# Test 2: Orthorhombic group
gap> SpaceGroupCohomologyRingGapInterface(16);
===========================================
Mod-2 Cohomology Ring of Group No. 16:
Z2[Ac,Acp,Ax,Ay,Az]/<R2>
R2:  Ax^2+Ac.Ax+Acp.Ax  Ay^2+Ac.Ay  Az^2+Acp.Az
===========================================
LSM:
1a Ac^2.Acp+Ac.Acp^2+Ac.Acp.Ax+Ac.Acp.Ay+Ac.Acp.Az+Ac.Ax.Az+Ac.Ay.Az+Ac^2.Az+A\
cp.Ax.Ay+Acp^2.Ay+Acp.Ay.Az+Ax.Ay.Az
1b Ac.Acp.Ax+Ac.Ax.Az+Acp.Ax.Ay+Ax.Ay.Az
1c Ac.Acp.Ay+Ac.Ay.Az+Acp.Ax.Ay+Acp^2.Ay+Acp.Ay.Az+Ax.Ay.Az
1d Ac.Acp.Az+Ac.Ax.Az+Ac.Ay.Az+Ac^2.Az+Acp.Ay.Az+Ax.Ay.Az
1e Acp.Ax.Ay+Ax.Ay.Az
1f Ac.Ax.Az+Ax.Ay.Az
1g Ac.Ay.Az+Acp.Ay.Az+Ax.Ay.Az
1h Ax.Ay.Az
true

# Test 3: Orthorhombic group with degree-3 generators
gap> SpaceGroupCohomologyRingGapInterface(22);
===========================================
Mod-2 Cohomology Ring of Group No. 22:
Z2[Ac,Acp,Axy,Axz,Cc,Cxyz]/<R2,R4,R6>
R2:  Acp.Axz+Ac.Axy  Axy^2+Acp.Axy  Axz^2+Ac.Axz
R4:  Ac.Cxyz+Ac.Cc+Axz.Cc  Acp.Cxyz+Acp.Cc+Axy.Cc  Axy.Cxyz  Axz.Cxyz
R6:  Cc^2+Ac^2.Acp.Cc+Ac.Acp^2.Cc  Cc.Cxyz+Ac^2.Acp.Cc+Ac^2.Axy.Cc+Ac.Acp^2.Cc\
+Ac.Acp.Axy.Cc  Cxyz^2+Ac^2.Acp.Cc+Ac^2.Axy.Cc+Ac.Acp^2.Cc+Ac.Acp.Axy.Cc
===========================================
LSM:
4a Ac^2.Acp+Ac.Acp^2+Ac.Acp.Axy+Ac.Acp.Axz+Cxyz
4b Cxyz
4c Cc+Cxyz
4d Ac.Acp.Axy+Ac.Acp.Axz+Cc+Cxyz
true

# Test 4: Tetragonal group with degree-4 generator
gap> SpaceGroupCohomologyRingGapInterface(108);
===========================================
Mod-2 Cohomology Ring of Group No. 108:
Z2[Amp,Am,Axyz,Ba,Bzxy,Dd]/<R2,R3,R4,R5,R6>
R2:  Amp.Am  Amp.Axyz  Axyz^2+Amp^2+Am^2
R3:  Am.Bzxy+Am^2.Axyz+Am.Axyz^2+Axyz.Ba  Axyz.Bzxy+Am^2.Axyz+Am.Axyz^2+Axyz.B\
a
R4:  Bzxy^2+Ba.Bzxy
R5:  Amp.Dd  Axyz.Dd+Am.Dd
R6:  Bzxy.Dd+Ba.Dd
R8:  Dd^2
===========================================
LSM:
4a Amp.Ba+Am.Ba+Axyz.Ba+Amp.Bzxy
4b Amp.Bzxy
true

# Test 5: Cubic group with degree-6 generators
gap> SpaceGroupCohomologyRingGapInterface(219);
===========================================
Mod-2 Cohomology Ring of Group No. 219:
Z2[Am,Ba,Bxyxzyz,Ca,Cb,Fd1,Fd2]/<R3,R4,R5,R6>
R3:  Am^3
R4:  Am^2.Ba  Am^2.Bxyxzyz  Am.Ca  Am.Cb  Bxyxzyz^2+Ba.Bxyxzyz
R5:  Ba.Cb+Bxyxzyz.Ca  Bxyxzyz.Cb+Bxyxzyz.Ca
R6:  Cb^2+Ca.Cb
R7:  Am.Fd1  Am.Fd2
R8:  Bxyxzyz.Fd1  Bxyxzyz.Fd2+Ba.Fd2
R9:  Cb.Fd1  Cb.Fd2+Ca.Fd2
R12:  Fd1^2+Ba^3.Ca^2+Ba^2.Bxyxzyz.Ca^2+Ca^4+Ca^3.Cb+Ca^2.Fd1  Fd1.Fd2  Fd2^2+\
Ba^2.Bxyxzyz.Ca^2+Ca^3.Cb+Ca^2.Fd2
===========================================
LSM:
8a Am.Ba+Am.Bxyxzyz+Ca+Cb
8b Am.Bxyxzyz+Cb
24c Am.Bxyxzyz
24d Am.Ba+Am.Bxyxzyz
true

gap> STOP_TEST("smoke.tst", 0);
