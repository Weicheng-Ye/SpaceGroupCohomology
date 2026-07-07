gap> START_TEST("SpaceGroupCohomology: integral contracting homotopy");
gap> LoadPackage("SpaceGroupCohomology");;
gap> G := SpaceGroupBBNWZ(3,16);;
gap> P := SGC_CrystallographicComplexWithGeometry(G);;
gap> SGC_AttachCellularContraction(P);;
gap> ok := true;;
gap> for q in [0..3] do
>     for i in [1..P!.dimension(q)] do
>         for g in [1..Minimum(Length(P!.elts),4)] do
>             if not SGC_NonFreeHomotopyCheck(P, q, [i,g]) then
>                 ok := false; Print("P-level failure: ", [q,i,g], "\n");
>             fi;
>         od;
>     od;
> od;
gap> ok;    # d h + h d = id on the non-free complex, over Z
true
gap> R0 := FreeGResolution(P, 4);;
gap> R := SGC_FreeGResolutionWithHomotopy(P, 4);;
gap> EvaluateProperty(R, "characteristic");
0
gap> List([0..4], i -> R0!.dimension(i)) = List([0..4], i -> R!.dimension(i));
true
gap> ok := true;;
gap> for n in [1..4] do
>     for i in [1..R0!.dimension(n)] do
>         if R0!.boundary(n,i) <> R!.boundary(n,i) then
>             ok := false; Print("boundary mismatch: ", [n,i], "\n");
>         fi;
>     od;
> od;
gap> ok;    # fork reproduces HAP's FreeGResolution boundaries exactly
true
gap> ok := true;;
gap> for k in [0..2] do
>     for i in [1..R!.dimension(k)] do
>         for g in [1..Minimum(Length(R!.elts),4)] do
>             if not SGC_TotalHomotopyCheck(R, k, [i,g]) then
>                 ok := false; Print("R-level failure: ", [k,i,g], "\n");
>             fi;
>         od;
>     od;
> od;
gap> ok;    # d h + h d = id (resp. id - [1,1_G] at k=0) on the free resolution
true
gap> # IT=98 (I4_122): body-centered, invariant Gramian != identity.
gap> # Regression for the 2026-07-06 "tile collapse jammed" bug: tile
gap> # queries must use the same invariant metric HAPcryst used to build
gap> # the fundamental domain.
gap> T1:=[[1,0,0,1],[0,1,0,0],[0,0,1,0],[0,0,0,1]];;
gap> T2:=[[1,0,0,0],[0,1,0,1],[0,0,1,0],[0,0,0,1]];;
gap> T3:=[[1,0,0,0],[0,1,0,0],[0,0,1,1],[0,0,0,1]];;
gap> G98 := Group(Concatenation([T1,T2,T3],PGGens230[98]));;
gap> Gp98 := AffineCrystGroupOnRight(GeneratorsOfGroup(TransposedMatrixGroup(G98)));;
gap> P98 := SGC_CrystallographicComplexWithGeometry(Gp98);;
gap> SGC_AttachCellularContraction(P98);;
gap> ok := true;;
gap> for q in [0..3] do
>     for i in [1..P98!.dimension(q)] do
>         for g in [1..Minimum(Length(P98!.elts),2)] do
>             if not SGC_NonFreeHomotopyCheck(P98, q, [i,g]) then
>                 ok := false; Print("P98-level failure: ", [q,i,g], "\n");
>             fi;
>         od;
>     od;
> od;
gap> ok;    # d h + h d = id on the IT=98 non-free complex, over Z
true
gap> R98 := SGC_FreeGResolutionWithHomotopy(P98, 4);;
gap> ok := true;;
gap> for k in [0..2] do
>     for i in [1..R98!.dimension(k)] do
>         for g in [1..Minimum(Length(R98!.elts),2)] do
>             if not SGC_TotalHomotopyCheck(R98, k, [i,g]) then
>                 ok := false; Print("R98-level failure: ", [k,i,g], "\n");
>             fi;
>         od;
>     od;
> od;
gap> ok;    # total homotopy identity on the IT=98 free resolution
true
gap> STOP_TEST("homotopy.tst", 0);
